require 'rails_helper'

describe "API V1" do
  describe "POST /api/v1/road_trip", type: :request do
    before do
      post '/api/v1/users', params: { email: "whatever@example.com", password: "password", password_confirmation: "password" }
      json = JSON.parse(response.body, symbolize_names: true)
      @api_key = json[:data][:attributes][:api_key]
    end
    it "returns travel time and arrival forecast", :vcr do
      params = { origin: "Denver,CO",
                 destination: "Pueblo,CO",
                 api_key: @api_key }
      post '/api/v1/road_trip', params: params

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:attributes]

      expect(data).to have_key :origin
      expect(data).to have_key :destination
      expect(data).to have_key :travel_time
      expect(data).to have_key :arrival_forecast

      expect(data[:origin]).to eq 'Denver,CO'
      expect(data[:destination]).to eq 'Pueblo,CO'
      expect(data[:arrival_forecast][:summary]).to eq 'Clear'
      expect(data[:arrival_forecast][:temperature]).to eq 88
    end
    it "returns unsuccessful due to invalid api_key" do
      params = { origin: "Denver,CO",
                 destination: "Pueblo,CO",
                 api_key: '' }
      post '/api/v1/road_trip', params: params

      expect(response).to_not be_successful
      expect(response).to have_http_status(401)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key :status
      expect(json).to have_key :code
      expect(json).to have_key :message

      expect(json[:message]).to eq 'Invalid api key'
    end
    it "returns unsuccessful due to missing parameter", :vcr do
      params = { origin: "Denver,CO",
                 destination: '',
                 api_key: @api_key }
      post '/api/v1/road_trip', params: params

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key :status
      expect(json).to have_key :code
      expect(json).to have_key :message

      expect(json[:message]).to eq 'Missing parameter'
    end
  end
end
