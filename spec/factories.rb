FactoryBot.define do 

	factory :item, class: "Item" do 
		name { "Pizza" }
		cost { 2.15 }
	end

	factory :order, class: "Order" do
		value { 6.45 }
	end

	factory :result, class: "Result" do
		order { [2.15, 2.15, 2.15] }
		names { ["Pizza", "Pizza", "Pizza"] }
	end

end