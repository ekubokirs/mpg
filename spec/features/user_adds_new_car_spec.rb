require 'spec_helper'

feature "user creates car", js: true do
	scenario "creating a car" do
		visit '/cars/new'

		fill_in 'Make', with: 'audi'
		fill_in 'Model', with: 'a8'
		fill_in 'Year', with: '2000'
		fill_in 'Current Milage', with: '14,000'
		fill_in	'Color', with: 'red'

		click_button 'Submit'

		expect(page).to have_content 'audi'
		expect(page).to have_content '2000'
		expect(current_path).to eql cars_path
	end
end

