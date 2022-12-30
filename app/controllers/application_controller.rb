# frozen_string_literal: true

# ApplicationController.rb
require 'faraday'
class ApplicationController < ActionController::Base
  include ShopifyHelper
end
