class OrderSaver
	def initialize(shopify_orders)
		@shopify_orders = shopify_orders
	end

	def migrate_orders
		@shopify_orders.each do |shopify_order|
			order = Order.new(
				id: shopify_order["id"],
				line_items: shopify_order["line_items"],
				current_total_tax: shopify_order["current_total_tax"],
				current_total_tax_set: shopify_order["current_total_tax_set"],
				customer: shopify_order["customer"],
				discount_applications: shopify_order["discount_applications"],
				email: shopify_order["email"],
				financial_status: shopify_order["financial_status"],
				fulfillment_status: shopify_order["fulfillment_status"],
				number: shopify_order["order_number"],
				total_shipping_price_set: shopify_order["total_shipping_price_set"],
				user_id: shopify_order["user_id"],
				contact_email: shopify_order["contact_email"],
				total_price_usd: shopify_order["total_price_usd"],
				total_tax: shopify_order["total_tax"],
				total_price: shopify_order["total_price"],
				)
			order.save
		end
	end
end
