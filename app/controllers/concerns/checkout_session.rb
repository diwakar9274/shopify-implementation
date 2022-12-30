# frozen_string_literal: true

# app/controllers/concerns/checkout_session.rb
# Concern to create payment and order
module CheckoutSession
  def save_checkout_session(checkout_session)
    ActiveRecord::Base.transaction do
      @payment = create_payment(checkout_session)
      response = create_shopify_order(checkout_session, @payment.id)

      order = JSON.parse(response.body)['order']
      @order = create_order(order)
    end
  end

  private

  def create_order(order)
    Order.create(id: order['id'], line_items: order['line_items'], current_total_tax: order['current_total_tax'],
                 current_total_tax_set: order['current_total_tax_set'], customer: order['customer'],
                 discount_applications: order['discount_applications'], email: order['email'],
                 financial_status: order['financial_status'], fulfillment_status: order['fulfillment_status'],
                 number: order['order_number'], total_shipping_price_set: order['total_shipping_price_set'],
                 user_id: order['user_id'], contact_email: order['contact_email'],
                 total_price_usd: order['total_price_usd'], total_tax: order['total_tax'],
                 total_price: order['total_price'], payment_id: order['note'])
  end

  def create_payment(checkout_session)
    Payment.create(id: checkout_session['payment_intent'], amount: checkout_session['amount_total'],
                   currency: checkout_session['currency'], email: checkout_session['customer_details']['email'],
                   variant_id: checkout_session['client_reference_id'])
  end

  def create_shopify_order(checkout_session, payment_id)
    stripe_line_items = Stripe::Checkout::Session.list_line_items(checkout_session[:id])['data']
    shopify = set_shopify_url
    response = shopify.post('orders.json') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { order: { email: checkout_session['customer_details']['email'],
                            financial_status: 'paid',
                            note: payment_id,
                            line_items: [{
                              variant_id: checkout_session['client_reference_id'],
                              quantity: stripe_line_items[0]['quantity']
                            }] } }.to_json
    end
    response
  end
end
