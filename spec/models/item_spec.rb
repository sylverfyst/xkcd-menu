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
		let(:item){ create(:item, name: "Bagel", cost: 3.80) }
		let(:item_2){ create(:item, name: "French Fries") }
		let(:item_3){ create(:item) }
		let(:order){ create(:order) }
		let(:result){ create(:result, names: [ "Pizza", "French Fries", "Pizza" ]) }

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

		it "creates the order" do
			Item.delete_and_import("tmp/menu.txt")

			expect(Order.first.attributes[:value]).to eq(order.attributes[:value])
		end
		it "creates the menu items" do
			Item.delete_and_import("tmp/menu.txt")

			expect(Item.find_by(name: "Apple").cost).not_to eq(item.cost)
		end
	end

	describe "#knapsack" do 

		it "handles the original problem" do
			Item.delete_and_import("tmp/standard.txt")
			Item.knapsack({names: [], costs: []})

			expect(Result.first[:names]).to eq(["mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit"])
		end
	end
end