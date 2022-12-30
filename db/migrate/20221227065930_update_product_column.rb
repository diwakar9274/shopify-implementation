# frozen_string_literal: true

# UpdateProductColumn
class UpdateProductColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :vendor, :vendor_name
    rename_column :products, :body_html, :description
  end
end
