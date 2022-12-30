class Product < ApplicationRecord
	serialize :options, Array
	has_many :variants,dependent: :destroy

	def self.search(option_name,option_value)
		products = Product.all
		unless option_name.blank? && option_value.blank?
			options = products.pluck(:options).flatten
			result = []
			options.each do |option|
			  if option["name"] == option_name && option["values"].include?(option_value)
			    result.push(option["product_id"])
			  end
			end
			return products.where(product_id: result) unless products.nil?
		end
		return products
	end
	
	def self.fetch_variants
		options = Product.pluck(:options).flatten
		variants = {}
		options.each do |option|
		  if variants[option["name"]]
		    variants[option["name"]] = variants[option["name"]].push(option["values"]).flatten.uniq
		  else
		   variants[option["name"]] = option["values"].uniq
		  end
		end
		variants
	end
end
