require 'rails_helper'

RSpec.describe Background, type: :model do
  describe 'initialize' do
    it 'has attributes' do
      info = { url: 'http://www.example.com/image.jpg' }
      background = Background.new(info)

      expect(background.class).to eq Background
      expect(background.id).to eq 1
      expect(background.url).to eq 'http://www.example.com/image.jpg'
    end
  end
  describe 'class methods' do
    it '.find', :vcr do
      background = Background.find('Austin, TX location')

      expect(background.class).to eq Background
    end
  end
end
