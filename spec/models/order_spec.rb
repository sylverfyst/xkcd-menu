# frozen_string_literal: true

require 'rails_helper'
require 'bigdecimal'
require 'bigdecimal/util'

RSpec.describe Order, type: :model do
  subject { create(:order) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).to_not be_valid
  end
end
