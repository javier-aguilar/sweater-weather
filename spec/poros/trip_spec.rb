require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'initialize' do
    it 'has attributes' do
      info = { id: '',
               origin: 'Denver,CO',
               destination: 'Pueblo,CO',
               travel_time: '1 hour 30 mins' }
      trip = Trip.new(info)

      expect(trip.class).to eq Trip
      expect(trip.id).to eq ''
      expect(trip.origin).to eq 'Denver,CO'
      expect(trip.destination).to eq 'Pueblo,CO'
      expect(trip.travel_time).to eq '1 hour 30 mins'
    end
  end
  describe 'instance methods' do
    it '#arrival_forecast', :vcr do
      new_time = Time.at(1591722000)
      Timecop.freeze(new_time)

      info = { id: '',
               origin: 'Denver,CO',
               destination: 'Pueblo,CO',
               travel_time: '1 hour 30 mins' }
      trip = Trip.new(info)

      expect(trip.arrival_forecast).to have_key :summary
      expect(trip.arrival_forecast).to have_key :temperature
    end
  end
  describe 'class methods' do
    it '.info', :vcr do
      trip = Trip.info('Denver,CO', 'Pueblo,CO')

      expect(trip.class).to eq Trip
      expect(trip.id).to eq ''
      expect(trip.origin).to eq 'Denver,CO'
      expect(trip.destination).to eq 'Pueblo,CO'
      expect(trip.travel_time).to eq '1 hour 48 mins'
    end
  end
end
