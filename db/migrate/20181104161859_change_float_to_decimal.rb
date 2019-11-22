# frozen_string_literal: true

class ChangeFloatToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :cost, :decimal
    change_column :orders, :value, :decimal
    change_column :results, :order, :decimal, default: [], array: true
  end
end
