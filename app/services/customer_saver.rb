class CustomerSaver
	def initialize(shopify_customers)
		@shopify_customers = shopify_customers
	end

	def migrate_customers
		@shopify_customers.each do |shopify_customer|
			customer = Customer.new(
				id: shopify_customer.id,
				first_name: shopify_customer.first_name,
				last_name: shopify_customer.last_name,
				default_address: shopify_customer.default_address,
				email: shopify_customer.email,
				verified_email: shopify_customer.verified_email,
				tax_exempt: shopify_customer.tax_exempt,
				tags: shopify_customer.tags,
				total_spent: shopify_customer.total_spent,
				phone: shopify_customer.phone,
				last_order_id: shopify_customer.last_order_id,
				currency: shopify_customer.currency
				)
			customer.save
		end
	end
end
