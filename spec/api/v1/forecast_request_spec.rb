require 'rails_helper'

describe "API V1" do
  describe "GET /api/v1/forecast" do
    it "returns forecast data", :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes].keys).to match_array([:location, :current, :hourly, :daily])
      expect(json[:data][:attributes][:location]).to eq("Denver, CO, USA")

      expect(json[:data][:attributes][:current][:sunrise]).to eq(1591529528)
      expect(json[:data][:attributes][:current][:sunset]).to eq(1591583161)
      expect(json[:data][:attributes][:current][:temp]).to eq(304.75)
      expect(json[:data][:attributes][:current][:feels_like]).to eq(301.34)
      expect(json[:data][:attributes][:current][:uvi]).to eq(10.74)
      expect(json[:data][:attributes][:current][:weather].first[:main]).to eq("Clear")

      expect(json[:data][:attributes][:hourly].first[:dt]).to eq(1591567200)
      expect(json[:data][:attributes][:hourly].first[:temp]).to eq(304.75)
      expect(json[:data][:attributes][:hourly].first[:weather].first[:main]).to eq("Clear")

      expect(json[:data][:attributes][:daily].first[:dt]).to eq(1591552800)
      expect(json[:data][:attributes][:daily].first[:temp][:min]).to eq(296.57)
      expect(json[:data][:attributes][:daily].first[:temp][:max]).to eq(304.75)
      expect(json[:data][:attributes][:daily].first[:weather].first[:main]).to eq("Clear")
    end
  end
end
