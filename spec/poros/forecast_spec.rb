require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe 'initialize' do
    it 'has attributes' do
      forecast = Forecast.new('Austin, TX, USA', 'data')

      expect(forecast.class).to eq Forecast
      expect(forecast.location).to eq 'Austin, TX, USA'
      expect(forecast.info).to eq 'data'
    end
  end
  describe 'class methods' do
    it '.get_info', :vcr do
      location = Location.info("denver,co")
      forecast = Forecast.get_info(location)

      expect(forecast.class).to eq Forecast
    end
  end
end
