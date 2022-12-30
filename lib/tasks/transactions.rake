namespace :transactions do
  desc "TODO"
  task migrate_transaction: :environment do
    checkout_sessions = Stripe::Checkout::Session.list()["data"]
    TransactionSaver.new(checkout_sessions).populate_transaction
  end
end
