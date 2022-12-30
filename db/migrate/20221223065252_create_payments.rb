# frozen_string_literal: true

# CreatePayments
class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: false do |t|
      t.float :amount
      t.string :id, null: false, unique: true
      t.string :currency
      t.bigint :variant_id, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
