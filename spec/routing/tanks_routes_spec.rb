require 'spec_helper'

describe 'tanks resource' do
	it 'routes/tanks/new to tanks#new' do
		expect(get:'/tanks/new').to route_to(
			controller: 'tanks',
			action: 'new'
			)
	end
end