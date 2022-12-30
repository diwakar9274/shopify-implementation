# frozen_string_literal: true

# orders_controller.rb
class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  include CheckoutSession
  def index
    @orders = Order.all
  end

  def new
    @product = Product.find(params[:product_id])
  end

  def create
    variant = Variant.includes(:product).find(params[:variant_id])
    @session = stipe_checkout_session(variant, params[:quantity])
    redirect_to @session.url, allow_other_host: true
  end

  def show
    @payment = begin
      Payment.find(@order[:payment_id])
    rescue StandardError
      nil
    end
    @product = Product.find_with_order(@order)
  end

  def success
    checkout_session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @product = Variant.find(checkout_session[:client_reference_id]).product
    if !Payment.find_by_id(checkout_session['payment_intent']).nil?
      render plain: 'Session Expired.'
    else
      save_checkout_session(checkout_session)
    end
    redirect_to order_path(@order)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def stipe_checkout_session(variant, _quantity)
    Stripe::Checkout::Session.create({
                                       payment_method_types: ['card'], client_reference_id: variant.id,
                                       line_items: [
                                         {
                                           price_data: {
                                             product_data: {
                                               name: variant.product.title << ' ' << variant.title
                                             },
                                             unit_amount: variant.price.to_i,
                                             currency: 'usd'
                                           },
                                           quantity: params[:quantity]
                                         }
                                       ],
                                       mode: 'payment',
                                       success_url: "#{ENV['ROOT_URL']}orders/success?session_id={CHECKOUT_SESSION_ID}",
                                       cancel_url: ENV['ROOT_URL']
                                     })
  end
end
