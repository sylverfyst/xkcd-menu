# frozen_string_literal: true

require 'rails_helper'
require 'bigdecimal'
require 'bigdecimal/util'

RSpec.describe Result, type: :model do
  subject { create(:result) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a order' do
    subject.order = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without names' do
    subject.names = nil
    expect(subject).to_not be_valid
  end

  describe '#fancy_result' do
    it 'pretty prints the order with no solution' do
      Item.delete_and_import('tmp/nosolution.txt')
      Item.knapsack(names: [], costs: [])
      fancy = Result.first
      fancy = (fancy&.fancy_result)
      expect(fancy).to eq(nil)
    end

    it 'pretty prints the original menu from the comic' do
      Item.delete_and_import('tmp/standard.txt')
      Item.knapsack(names: [], costs: [])
      fancy = Result.first.fancy_result

      expect(fancy).to eq([{ 'id' => nil, 'name' => 'mixed fruit', 'cost' => 0.215e1.to_d, 'count' => 7 }])
    end

    it 'pretty prints the menu with items that cost the same amount' do
      Item.delete_and_import('tmp/menu.txt')
      Item.knapsack(names: [], costs: [])
      fancy = Result.first.fancy_result

      expect(fancy).to eq([{ 'id' => nil, 'name' => 'Pizza', 'cost' => 0.215e1.to_d, 'count' => 3 }])
    end
  end
end
