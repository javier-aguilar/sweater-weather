require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'initialize' do
    it 'has attributes' do
      info = { title: 'Austin, TX, USA',
               lat: 30.2,
               lng: 97.7 }
      location = Location.new(info)

      expect(location.class).to eq Location
      expect(location.title).to eq 'Austin, TX, USA'
      expect(location.lat).to eq 30.2
      expect(location.lng).to eq 97.7
    end
  end
  describe 'class methods' do
    it '.info', :vcr do
      location = Location.info('Austin, TX')

      expect(location.class).to eq Location
    end
  end
end
