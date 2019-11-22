# frozen_string_literal: true

class Result < ApplicationRecord
  validates_presence_of :order, :names
  def fancy_result
    items = []
    types = names.uniq
    types.each do |item|
      item_object = Item.where(name: item).select('name, cost').first.as_json
      count = names.count(item)
      item_object['count'] = count
      items.push(item_object)
    end
    items
  end
end
