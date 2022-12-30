class ImportOrderJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false
  def perform(shopify_orders)
    OrderSaver.new(shopify_orders).migrate_orders
  end
end
