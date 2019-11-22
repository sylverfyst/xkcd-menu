# frozen_string_literal: true

class AddResultArrayToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :order, :float, array: true, default: []
  end
end
