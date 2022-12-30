class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :line_items
      t.float :current_total_tax
      t.jsonb :current_total_tax_set
      t.string :customer
      t.text :discount_applications
      t.string :email
      t.integer :financial_status
      t.string :fulfillment_status
      t.integer :number
      t.jsonb :total_shipping_price_set
      t.string :total_tax
      t.integer :total_price
      t.bigint :user_id
      t.string :contact_email
      t.integer :total_price_usd

      t.timestamps
    end
  end
end
