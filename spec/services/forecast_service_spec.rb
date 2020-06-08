require 'rails_helper'

describe ForecastService do
  context "instance methods" do
    context "#forecast_info" do
      it "returns forecast_info", :vcr do
        location = Location.info('Denver,CO')
        forecast = ForecastService.new.forecast_info(location)

        expect(forecast).to be_a Hash

        expect(forecast).to have_key :current
        expect(forecast).to have_key :minutely
        expect(forecast).to have_key :hourly
        expect(forecast).to have_key :daily
      end
    end
  end
end
