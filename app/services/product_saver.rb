# frozen_string_literal: true

# ProductSaver
class ProductSaver
  def initialize(shopify_products)
    @shopify_products = shopify_products
  end

  def migrate_products
    @shopify_products.each do |shopify_product|
      product = Product.new(
        product_id: shopify_product['id'],
        handle: shopify_product['handle'],
        title: shopify_product['title'],
        body_html: shopify_product['body_html'],
        vendor: shopify_product['vendor'],
        tags: shopify_product['tags'],
        images: shopify_product.fetch('image', {})&.fetch('src', nil),
        options: shopify_product['options'],
        status: shopify_product['status']
      )
      product_variants = []
      shopify_product['variants'].each do |shopify_variant|
        product_variants << product.variants.new(title: shopify_variant['title'], barcode: shopify_variant['barcode'],
                                                 position: shopify_variant['position'],
                                                 compare_at_price: shopify_variant['compare_at_price'],
                                                 grams: shopify_variant['grams'], id: shopify_variant['id'],
                                                 option: shopify_variant['option'], sku: shopify_variant['sku'],
                                                 price: shopify_variant['price'], taxable: shopify_variant['taxable'])
      end
      product.variants = product_variants
      product.save
    end
  end
end
