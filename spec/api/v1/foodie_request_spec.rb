require 'rails_helper'

describe "API V1" do
  describe "GET /api/v1/foodie" do
    it "returns food and forecast information for a city", :vcr do
      get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:attributes]
      expect(data).to have_key :end_location
      expect(data).to have_key :travel_time
      expect(data).to have_key :forecast
      expect(data).to have_key :restaurant

      expect(data[:end_location]).to eq "pueblo,co"
      expect(data[:travel_time]).to eq "1 hour 48 mins"

      expect(data[:restaurant][:name]).to eq "Angelo's Pizza Parlor"
      expect(data[:restaurant][:address]).to eq "105 E Riverwalk, Pueblo 81003"
    end
    it "returns food and forecast information for denver to austin", :vcr do
      get '/api/v1/foodie?start=denver,co&end=austin,tx&search=mexican'

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:attributes]
      expect(data).to have_key :end_location
      expect(data).to have_key :travel_time
      expect(data).to have_key :forecast
      expect(data).to have_key :restaurant

      expect(data[:end_location]).to eq "austin,tx"
      expect(data[:travel_time]).to eq "14 hours 9 mins"
    end
    it "returns error", :vcr do
      get '/api/v1/foodie?start=denver,co&search=mexican'

      expect(response).to_not be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:errors].first
      expect(data).to have_key :id
      expect(data).to have_key :title
    end
  end
end
