# frozen_string_literal: true

# UpdateVariantColumn
class UpdateVariantColumn < ActiveRecord::Migration[7.0]
  def up
    change_column :variants, :compare_at_price, 'float USING CAST(compare_at_price AS float)'
  end

  def down
    change_column :variants, :compare_at_price, :string
  end
end
