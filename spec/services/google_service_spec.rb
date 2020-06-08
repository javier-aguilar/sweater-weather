require 'rails_helper'

describe GoogleService do
  context "instance methods" do
    context "#geocode_info" do
      it "returns geo info", :vcr do
        geo_info = GoogleService.new.geocode_info('Denver,CO')

        expect(geo_info).to be_a Hash

        expect(geo_info[:results].first[:geometry][:location]).to have_key :lat
        expect(geo_info[:results].first[:geometry][:location]).to have_key :lng
      end
    end
  end
end
