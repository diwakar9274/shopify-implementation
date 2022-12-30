# frozen_string_literal: true

# PaymentsController
class PaymentsController < ApplicationController
  def index
    @payments = Payment.includes(variant: :product).all
  end
end
