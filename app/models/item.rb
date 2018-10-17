class Item < ApplicationRecord
	require 'pry'
	
	def self.delete_and_import(file)
		Item.all.destroy_all
		Order.all.destroy_all
		Result.all.destroy_all

		File.open(file, "r").each_line do |line|
			data = line.gsub(/\n/, "").split(/,/)
			if data.length == 1 
				Order.create(value: data[0].gsub(/[^\.0-9]/,'').to_f)
			else
				Item.create(name: data[0], cost: data[1].gsub(/[^\.0-9]/,'').to_f)
			end
		end
	end

	def self.knapsack(order)
		item_costs = Item.all.pluck(:cost)
		total = order.reduce(0, :+)
		item_costs.each do |c|
			if ( ( total + c ) == Order.first[:value] )
				temp = order + [c]
				temp.sort!
				Result.where(order: ( temp ) ).first_or_create
			elsif ( ( total + c ) < Order.first[:value] )
				knapsack( order + [c] )
			end
		end
	end
end
