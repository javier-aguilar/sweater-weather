require 'rails_helper'

describe "API V1" do
  describe "GET /api/v1/backgrounds" do
    it "returns background data", :vcr do
      get '/api/v1/backgrounds?location=denver,co'

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes].keys).to match_array([:url])
      expect(json[:data][:attributes][:url]).to include("https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2")
    end
  end
end
