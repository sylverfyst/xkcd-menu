# frozen_string_literal: true

class Order < ApplicationRecord
  validates_presence_of :value
end
