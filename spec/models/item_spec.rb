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
		let(:item){ create(:item, name: "Bagel") }
		let(:item_2){ create(:item, name: "French Fries") }
		let(:order){ create(:order) }
		let(:result){ create(:result, names: [ "Bagel", "French Fries", "Bagel" ]) }

		it "destroys all items" do 
			expect {
				Item.delete_and_import("tmp/menu.txt")
			}.to change{ Item.exists?(item.id) && Item.exists?(item_2.id) }.to false
		end

		it "destroys all orders" do 
			expect {
				Item.delete_and_import("tmp/menu.txt")
			}.to change{ Order.exists?(order.id) }.to false
		end

		it "destroys all results" do 
			expect {
				Item.delete_and_import("tmp/menu.txt")
			}.to change{ Result.exists?(result.id) }.to false
		end

		it "reads the txt file"
		it "stores the data and splits into lines"
		it "checks for the order in the first line"
		it "validates order"
		it "creates the items from the rest of the file"
	end
end