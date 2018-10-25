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
		items = Item.all.pluck(:name, :cost)
		total = order[:costs].reduce(0, :+)

		items.each do |item|
			temp = {
				names: ( order[:names] + [ item[0] ] ).sort!, 
				costs: ( order[:costs] + [ item[1] ] ).sort!, 
				total: total + item[1]
			}
			if ( temp[:total] == Order.first[:value] ) 
				Result.where( names: temp[:names], order: temp[:costs] ).first_or_create
			elsif ( temp[:total] < Order.first[:value] )
				knapsack( 
					{ 
						names: temp[:names], 
						costs: temp[:costs] 
					} 
				)
			end
		end
	end
end
