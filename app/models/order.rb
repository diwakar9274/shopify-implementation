# frozen_string_literal: true

# Order
class Order < ApplicationRecord
  belongs_to :payment
end
