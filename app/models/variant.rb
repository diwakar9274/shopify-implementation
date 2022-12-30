class Variant < ApplicationRecord
	belongs_to :product
	store :option, accessors: [:option1, :option2, :option3], coder: JSON

	self.primary_key = :id
	has_many :transaction_histories
end
