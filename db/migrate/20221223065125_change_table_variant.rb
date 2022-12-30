# frozen_string_literal: true

# ChangeTableVariant
class ChangeTableVariant < ActiveRecord::Migration[7.0]
  def change
    change_column :variants, :id, :bigint, null: false, unique: true
  end
end
