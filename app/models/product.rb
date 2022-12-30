# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  serialize :options, Array
  has_many :variants, dependent: :destroy

  scope :find_with_order, ->(order) { find_by_product_id(eval(order.line_items).pluck('product_id').first) }

  def self.search(option_name, option_value)
    products = Product.all
    unless option_name.blank? && option_value.blank?
      options = products.pluck(:options).flatten
      result = []
      options.each do |option|
        result.push(option['product_id']) if option['name'] == option_name && option['values'].include?(option_value)
      end
      return products.where(product_id: result) unless products.nil?
    end
    products
  end

  def self.fetch_variants
    options = Product.pluck(:options).flatten
    variants = {}
    options.each do |option|
      variants[option['name']] = if variants[option['name']]
                                   variants[option['name']].push(option['values']).flatten.uniq
                                 else
                                   option['values'].uniq
                                 end
    end
    variants
  end
end
