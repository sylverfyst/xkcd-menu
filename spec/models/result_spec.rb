require 'rails_helper'
require 'bigdecimal'
require 'bigdecimal/util'

RSpec.describe Result, type: :model do
	describe "#fancy_result" do
		
		it "checks for items" do
			item = create(:item)
			order = create(:order)
			result = create(:result)
			type = result.names[0].to_s
			temp_item = Item.where(name: type).last

			expect(temp_item.attributes).to eq(Item.find_by(name: "Pizza").attributes)
		end

		it "checks for different types of menu items" do
			item = create(:item)
			order = create(:order)
			result = create(:result)
			expect(result.names.uniq).to eq(["Pizza"])
		end

		it "gets the number of different types in the order and adds them to the item object" do
			item = create(:item)
			order = create(:order)
			result = create(:result)
			item_object = Item.where(name: result.names[0]).select("name, cost").first.as_json
			count = result.names.count(result.names[0])
			item_object["count"] = count

			expect(item_object).to eq({"id" => nil, "name" => "Pizza", "cost" => 0.215e1.to_d, "count" => 3})
		end

		it "pretty prints the order" do
			item = create(:item)
			order = create(:order)
			result = create(:result)
			fancy = result.fancy_result

			expect(fancy).to eq([{"id" => nil, "name" => "Pizza", "cost" => 0.215e1.to_d, "count" => 3}])
		end
	end
end