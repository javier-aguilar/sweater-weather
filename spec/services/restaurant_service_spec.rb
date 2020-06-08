require 'rails_helper'

describe RestaurantService do
  context "instance methods" do
    context "#get_info" do
      it "returns restaurant info", :vcr do
        info = { title: 'Austin, TX, USA',
                 lat: 30.2,
                 lng: 97.7 }
        location = Location.new(info)

        restaurant_info = RestaurantService.new.get_info(location, 55)

        expect(restaurant_info).to be_a Hash
      end
    end
    context "#cuisines" do
      it "returns cuisines info", :vcr do
        cuisine_info = RestaurantService.new.cuisines

        expect(cuisine_info).to be_a Hash
      end
    end
  end
end
