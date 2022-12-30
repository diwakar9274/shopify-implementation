class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def new
		@product = Product.find(params[:product_id])
	end

	def create
		variant = Variant.includes(:product).find(params[:variant_id])
	  @session = Stripe::Checkout::Session.create({
		  payment_method_types: ['card'],
		  client_reference_id: variant.id,
		  line_items: [
		   {
		    	price_data: {
		    	product_data: {
          name: variant.product.title << " " << variant.title,
        },
		      unit_amount: variant.price.to_i,
		      currency: 'usd',
		    },
		    quantity: params[:quantity],
		  }
		  ],
		  mode: 'payment',
		  success_url: ENV["ROOT_URL"] + "orders/success?session_id={CHECKOUT_SESSION_ID}",
		  cancel_url: ENV["ROOT_URL"],
		})
		redirect_to @session.url, allow_other_host: true
  end

  def success
  	order_session = Stripe::Checkout::Session.retrieve(params[:session_id])
  	@product = Variant.find(order_session.client_reference_id).product
  end

  def cancel

  end
end
