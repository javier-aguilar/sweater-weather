require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe 'initialize' do
    it 'has attributes', :vcr do
      info = { end_location: "seattle,wa",
               travel_time: "1 hour 30 mins",
               cuisine: "Korean" }
      travel = Travel.new(info)

      expect(travel.class).to eq Travel
      expect(travel.id).to eq ''
      expect(travel.end_location).to eq 'seattle,wa'
      expect(travel.travel_time).to eq '1 hour 30 mins'
    end
  end
  describe 'instance methods' do
    it '#forecast', :vcr do
      info = { end_location: "seattle,wa",
               travel_time: "1 hour 30 mins",
               cuisine: "Korean" }
      travel = Travel.new(info)

      expect(travel.class).to eq Travel
      expect(travel.forecast).to have_key :summary
      expect(travel.forecast).to have_key :temperature
    end
    it '#restaurant', :vcr do
      info = { end_location: "seattle,wa",
               travel_time: "1 hour 30 mins",
               cuisine: "Korean" }
      travel = Travel.new(info)

      expect(travel.class).to eq Travel
      expect(travel.restaurant).to have_key :name
      expect(travel.restaurant).to have_key :address
    end
  end
end
