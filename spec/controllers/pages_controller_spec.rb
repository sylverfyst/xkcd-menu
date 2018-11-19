require 'rails_helper'

RSpec.describe PagesController, type: :controller do
	describe "GET index" do
		it "displays the index page" do
			#placeholder
		end
	end

	describe "GET order" do
		it "gets all orders and pretty prints them if they exist" do
			#placeholder
		end
	end

	describe "POST import" do 
		it "runs the delete and import method on the new file from params and then runs the knapsack method" do
			#placeholder
		end
	end
end