require 'rails_helper'

RSpec.describe Item, type: :model do
	subject { build(:item) }

	it "is valid with valid attributes" do 
		expect(subject).to be_valid
	end

	it "is not valid without a name" do 
		subject.name = nil
		expect(subject).to_not be_valid
	end

	it "is not valid without a cost" do 
		subject.cost = nil
		expect(subject).to_not be_valid
	end

	describe "#delete_and_import" do
		before(:each) do
			item = create(:item)
			item_2 = create(:item, name: "French Fries")
			order = create(:order)
			result = create(:result, names: [ "Pizza", "French Fries", "Pizza" ])
		end

		it "destroys all items" do 
			expect {
				Item.delete_and_import
			}.to change{ Item.any? }.to false
		end

		it "destroys all orders" do 
			expect {
				Order.delete_and_import
			}.to change{ Order.any? }.to false
		end

		it "destroys all results" do 
			expect {
				Result.delete_and_import
			}.to change{ Result.any? }.to false
		end

		it "reads the csv file"
		it "stores the data and splits into lines"
		it "checks for the order in the first line"
		it "validates order"
		it "creates the items from the rest of the file"
	end
end