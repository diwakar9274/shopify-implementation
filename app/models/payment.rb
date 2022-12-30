# frozen_string_literal: true

# Payment
class Payment < ApplicationRecord
  belongs_to :variant
  has_one :order

  self.primary_key = :id
end
