# frozen_string_literal: true

# AddColumnToOrders
class AddColumnToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :payment_id, :string
  end
end
