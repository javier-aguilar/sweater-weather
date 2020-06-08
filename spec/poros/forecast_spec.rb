require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe 'initialize' do
    it 'has attributes' do
      location = { current: 'current data', hourly: 'hourly data', daily: 'daily data'}
      forecast = Forecast.new('Austin, TX, USA', location)

      expect(forecast.class).to eq Forecast
      expect(forecast.location).to eq 'Austin, TX, USA'
      expect(forecast.current).to eq 'current data'
      expect(forecast.hourly).to eq 'hourly data'
      expect(forecast.daily).to eq 'daily data'
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
