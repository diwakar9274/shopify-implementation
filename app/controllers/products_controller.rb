# frozen_string_literal: true

# ProductsController
class ProductsController < ApplicationController
  def index
    @variants = Product.fetch_variants
    @products = Product.search(params[:option_name], params[:option_value]).includes(:variants)
  end
end
