require 'spec_helper'

feature "user creates tank", js: true do
	scenario "creating a tank" do
		visit '/tanks/new'

		fill_in 'Amount', with: '12.5'
		fill_in 'Price', with: '$15.70'
		fill_in 'Current Milage', with: '150,000'


		click_button 'Submit'

		expect(page).to have_content '12.5'
		expect(page).to have_content '$15.70'
		expect(current_path).to eql tanks_path
	end
end

