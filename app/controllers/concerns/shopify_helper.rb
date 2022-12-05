module ShopifyHelper
	def set_shopify_url
		shopify = Faraday.new(
		  url: 'https://diwakar-testing.myshopify.com/admin/api/2022-10',
		  headers: {'Content-Type' => 'application/json','X-Shopify-Access-Token' => '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'}
		)
	end
end