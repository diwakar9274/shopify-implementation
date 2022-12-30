class TransactionSaver
	def initialize(checkout_sessions)
		@checkout_sessions = checkout_sessions
	end

	def populate_transaction
		price_ids = TransactionHistory.pluck(:price_id)
		@checkout_sessions.each do |checkout_session|
			unless price_ids.include?(checkout_session["payment_intent"])
				TransactionHistory.create(price_id: checkout_session["payment_intent"],price: checkout_session["amount_total"],currency: checkout_session["currency"],email: checkout_session["customer_details"]["email"],variant_id: checkout_session["client_reference_id"])
			end
		end
	end
end
