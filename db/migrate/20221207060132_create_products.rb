class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.bigint :product_id
      t.string :handle
      t.string :tags
      t.string :title
      t.text :images
      t.text :options
      t.string :status
      t.text :variants
      t.string :vendor
      t.string :body_html
      t.string :type
      
      t.timestamps
    end
  end
end
