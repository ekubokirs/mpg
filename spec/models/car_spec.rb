require 'spec_helper'

describe Car do
	it "is a car" do
		expect(Car.new).to be_a(Car)
	end
end