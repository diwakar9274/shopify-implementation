# frozen_string_literal: true

# Variant
class Variant < ApplicationRecord
  belongs_to :product
  has_many :payments

  store :option, accessors: %i[option1 option2 option3], coder: JSON

  self.primary_key = :id
end
