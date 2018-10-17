class Result < ApplicationRecord
	def fancy_result
		items = []
		types = self.order.uniq
		types.each do |item|
			item_object = Item.where(cost: item).select("name, cost").first.as_json
			count = self.order.count(item)
			item_object["count"] = count
			items.push(item_object)
		end
		return items
	end
end
