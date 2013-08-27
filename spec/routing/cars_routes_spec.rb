require 'spec_helper'

describe 'cars resource' do
	it 'routes/cars/new to cars#new' do
		expect(get:'/cars/new').to route_to(
			controller: 'cars',
			action: 'new'
			)
	end
end