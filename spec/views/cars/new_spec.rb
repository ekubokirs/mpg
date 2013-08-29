require 'spec_helper'

describe 'cars/new' do
	before do
		assign(:car, stub_model(Car))
		render
	end
	it 'renders the new template' do
		render
		expect(view).to render_template('new')
	end
	it 'has a form with brand input' do
		expect(rendered).to include('brand')
	end
end