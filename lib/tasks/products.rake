namespace :products do
  desc "TODO"
  task migrate_data: :environment do
    product_number = Product.pluck(:handle)
    shopify = Faraday.new(
      url: 'https://diwakar-testing.myshopify.com/admin/api/2022-10',
      headers: {'Content-Type' => 'application/json','X-Shopify-Access-Token' => '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'}
    )
    res = JSON.parse shopify.get('products.json').body.gsub('=>', ':')
    @shopify_orders = res["products"]
    @shopify_orders = @shopify_orders.select {|product| !product_number.include?(product["handle"])}
    ProductSaver.new(@shopify_orders).migrate_products
  end

end
