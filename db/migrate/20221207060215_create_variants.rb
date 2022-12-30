class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants,id: false do |t|
      t.string :barcode
      t.integer :position
      t.string :compare_at_price
      t.integer :grams
      t.bigint :id
      t.jsonb :option
      t.string :price
      t.integer :product_id
      t.string :sku
      t.boolean :taxable
      t.string :title
      
      t.timestamps
    end
  end
end
