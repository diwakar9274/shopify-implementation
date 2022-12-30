class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers,id: false do |t|
      t.bigint :id,primay_key: true
      t.string :first_name
      t.string :last_name
      t.jsonb :default_address
      t.string :email
      t.boolean :verified_email
      t.string :tax_exempt
      t.string :tags
      t.decimal :total_spent
      t.string :phone
      t.bigint :last_order_id
      t.string :currency

      t.timestamps
    end
  end
end
