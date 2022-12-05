class ProductsController < ApplicationController
	def index
		shopify = set_shopify_url
		res = JSON.parse shopify.get('products.json').body.gsub('=>', ':')
		@products = res["products"]
	end
end