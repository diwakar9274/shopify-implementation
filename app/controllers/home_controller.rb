class HomeController < ApplicationController
	def index
		shopify = set_shopify_url
		res = JSON.parse shopify.get('shop.json').body.gsub('=>', ':')
		@shop = res["shop"]
	end
end