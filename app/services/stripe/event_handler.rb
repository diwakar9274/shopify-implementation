module Stripe
	class EventHandler
  	def call(event)
    	method = 'handle_' + event.type.tr('.', '_')
      send(method,event)
	   	rescue JSON::ParserError => e
	      render json: { status: 400, error: 'Invalid payload' }
	      Raven.capture_exception(e)
	   	rescue Stripe::SignatureVerificationError => e
	      render json: { status: 400, error: 'Invalid signature' }
	      Raven.capture_exception(e)
   	end

	 	def handle_checkout_session_completed(event)
	 	  unless !!TransactionHistory.find_by_price_id(event.data.object["payment_intent"])
		 	  ActiveRecord::Base.transaction do
			 	  TransactionHistory.create(price_id: event.data.object["payment_intent"],price: event.data.object["amount_total"],currency: event.data.object["currency"],email: event.data.object["customer_details"]["email"],variant_id: event.data.object["client_reference_id"])
			 	  stripe_line_items = Stripe::Checkout::Session.list_line_items(event.data.object["id"])["data"]
			 	  shopify = set_shopify_url
			 	  response = shopify.post('orders.json') do |req|
			 	  	req.headers['Content-Type'] = 'application/json'
		  			req.body = {order: {email: 'test@testingmail.com',financial_status: "paid",line_items: [{
		  				variant_id: event.data.object["client_reference_id"],
		  				quantity: stripe_line_items[0]["quantity"]
		  			}]}}.to_json
			 	  end
			 	end
			 	puts "New Transaction"
			end
	 	end

	 	def set_shopify_url
			shopify = Faraday.new(
			  url: 'https://diwakar-testing.myshopify.com/admin/api/2022-10',
			  headers: {'Content-Type' => 'application/json','X-Shopify-Access-Token' => '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'}
			)
		end
	 end
end
