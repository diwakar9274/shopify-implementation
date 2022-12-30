namespace :orders do
  desc "TODO"
  task migrate_data: :environment do
    order_ids = Order.pluck(:id)
    shopify = Faraday.new(
      url: 'https://diwakar-testing.myshopify.com/admin/api/2022-10',
      headers: {'Content-Type' => 'application/json','X-Shopify-Access-Token' => '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'}
    )
    res = JSON.parse shopify.get('orders.json?status=any').body.gsub('=>', ':')
    @shopify_orders = res["orders"]
    @shopify_orders = @shopify_orders.select {|order| !order_ids.include?(order["id"])}
    # ImportOrderJob.perform_later(@shopify_orders)
    OrderSaver.new(@shopify_orders).migrate_orders
  end
end
 