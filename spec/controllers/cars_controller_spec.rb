require 'spec_helper'

describe CarsController do
	describe 'GET new' do
		it "returns a sucessful response" do
			get :new
			expect(response).to be_success
		end

		it "sets a car instance variable" do
			get :new
			expect(assigns[:car]).to be
		end
	end

	describe 'POST create' do
		it "creates a new car" do
			params = {car: {"brand" => 'toyota', "color" => 'blue', "current_miles" => "15,000", "make" => "rav4", "year"=>"2011"}}
			mock_toyota = mock_model(Car)
			Car.should_receive(:new).with(params[:car]).and_return(mock_toyota)
			mock_toyota.should_receive(:save).and_return(true)
			post :create, params
		end
	end
end