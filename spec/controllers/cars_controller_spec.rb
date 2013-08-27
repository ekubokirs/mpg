require 'spec_helper'

describe CarsController do
	describe 'GET new' do
		it "returns a sucessful response" do
			get :new
			expect(response).to be_success
		end
	end
end