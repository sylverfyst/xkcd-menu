require 'rails_helper'
require 'bigdecimal'
require 'bigdecimal/util'

RSpec.describe Result, type: :model do
	describe "#fancy_result" do
		let(:item){ create(:item) }
		let(:order){ create(:order) }
		let(:result){ create(:result) }
		
		it "checks for items" do
			expect(Item.where(name: result.names[0])).to eq(Item.find_by(name: "Pizza"))
		end

		it "checks for different types of menu items" do
			expect(result.names.uniq).to eq(["Pizza"])
		end

		it "generates json object of menu item" do 
			expect(Item.find_by(name: result.names[0]).select("name, cost").as_json).to eq({"id" => nil, "name" => "Pizza", "cost" => 0.215e1.to_d})
		end

		it "gets the number of different types in the order and adds them to the item object" do
			item_object = Item.where(name: result.names[0]).select("name, cost").first.as_json
			count = result.names.count(result.names[0])
			item_object["count"] = count
			expect(item_object).to eq({"id" => nil, "name" => "Pizza", "cost" => 0.215e1.to_d, "count" => 3})
		end

		it "pretty prints the order" do

			fancy = result.fancy_result

			expect(fancy).to eq([{"id" => nil, "name" => "Pizza", "cost" => 0.215e1.to_d, "count" => 3}])
		end
	end
end