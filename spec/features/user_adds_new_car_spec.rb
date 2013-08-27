require 'spec_helper'

feature "user creates car", js: true do
	scenario "creating a car" do
		visit '/cars/new'

		fill_in 'model', with: 'audi'
		fill_in 'year', with: '2000'

		click_button 'save'

		expect(page).to have_content 'audi'
		expect(page).to have_content '2000'
		expect(current_path).to eql cars_path
	end
end

