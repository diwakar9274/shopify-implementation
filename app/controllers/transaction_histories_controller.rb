class TransactionHistoriesController < ApplicationController
  def index
    @transactions = TransactionHistory.includes(variant: :product).all
  end
end
