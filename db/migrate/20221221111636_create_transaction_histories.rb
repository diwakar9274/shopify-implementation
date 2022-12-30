class CreateTransactionHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_histories do |t|
      t.bigint :variant_id
      t.integer :quantity
      t.decimal :price
      t.string :price_id
      t.string :currency
      t.string :email

      t.timestamps
    end
  end
end
