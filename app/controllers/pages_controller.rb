class PagesController < ApplicationController
	def index
	end

	def order
		@output = Result.all.pluck(:order)
		if @output == []
			@output = "There are no viable solutions"
		end
	end

	def import
		Item.delete_and_import(params[:file].path)
    	Item.knapsack([])
    	redirect_to order_pages_path
	end
	
end
