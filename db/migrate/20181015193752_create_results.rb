# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results, &:timestamps
  end
end
