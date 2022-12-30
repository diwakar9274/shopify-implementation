# frozen_string_literal: true

namespace :payments do
  desc 'TODO'
  task populate: :environment do
    checkout_sessions = Stripe::Checkout::Session.list['data']
    PaymentService.new(checkout_sessions).populate
  end
end
