# frozen_string_literal: true

# PaymentService
class PaymentService
  def initialize(checkout_sessions)
    @checkout_sessions = checkout_sessions
  end

  def populate
    payments = Payment.pluck(:id)
    @checkout_sessions.each do |checkout_session|
      next if payments.include?(checkout_session['payment_intent'])

      Payment.create(id: checkout_session['payment_intent'], amount: checkout_session['amount_total'],
                     currency: checkout_session['currency'], email: checkout_session['customer_details']['email'],
                     variant_id: checkout_session['client_reference_id'])
    end
  end
end
