# frozen_string_literal: true

# ChangeOrderFinancialStatusColumn
class ChangeOrderFinancialStatusColumn < ActiveRecord::Migration[7.0]
  def up
    change_column :orders, :financial_status, :string
  end

  def down
    change_column :orders, :financial_status, :integer
  end
end
