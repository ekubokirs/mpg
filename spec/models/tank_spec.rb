require 'spec_helper'

describe Tank do
	it "is a tank" do
		expect(Tank.new).to be_a(Tank)
	end
end