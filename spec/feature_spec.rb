require 'rails_helper'

RSpec.feature "Test Import and Knapsack", :type => :feature do 
	scenario "User uploads standard file to order" do
		visit "/"

		find('form input[type="file"]').set('tmp/standard.txt')
		click_on "Import"

		expect(page).to have_content("mixed fruit x 7")
	end

	scenario "User uploads Items with the same cost file to order" do
		visit "/"

		find('form input[type="file"]').set('tmp/menu.txt')
		click_on "Import"

		expect(page).to have_content("French Fries x 1\nPer Item Cost: $2.15\nPizza x 2\nPer Item Cost: $2.15")
	end

	scenario "User uploads Items with no solution" do
		visit "/"

		find('form input[type="file"]').set('tmp/nosolution.txt')
		click_on "Import"

		expect(page).to have_content("There are no viable solutions")
	end
end