# frozen_string_literal: true

# UpdateOrdersSchema
class UpdateOrdersSchema < ActiveRecord::Migration[7.0]
  def up
    change_column :orders, :total_tax, 'float USING CAST(total_tax AS float)'
    change_column :orders, :total_price, :float
    change_column :orders, :total_price_usd, :float
  end

  def down
    change_column :orders, :total_tax, :string
    change_column :orders, :total_price, :integer
    change_column :orders, :total_price_usd, :integer
  end
end
