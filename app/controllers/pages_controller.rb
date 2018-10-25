class PagesController < ApplicationController
	def index
	end

	def order
		@results = Result.all.pluck(:order)
		@output = []
		if @results == []
			@output = "There are no viable solutions"
		else
			Result.all.each do | o|
				@output.push(o.fancy_result)
			end
		end
	end

	def import
		Item.delete_and_import(params[:file].path)
    	Item.knapsack({names: [], costs: []})
    	redirect_to order_pages_path
	end
	
end
