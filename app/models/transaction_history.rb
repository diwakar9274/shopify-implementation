class TransactionHistory < ApplicationRecord
	belongs_to :variant

	validates :price_id,presence: true,uniqueness: true,allow_nil: false
end
