require 'rails_helper'

describe "API V1" do
  describe "GET /api/v1/forecast" do
    it "returns forecast data", :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:attributes]
      expect(data).to have_key :current
      expect(data).to have_key :details
      expect(data).to have_key :hourly
      expect(data).to have_key :daily
    end
  end
  it "returns forecast data for seattle", :vcr do
    get '/api/v1/forecast?location=seattle,wa'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:attributes]
    expect(data).to have_key :current
    expect(data).to have_key :details
    expect(data).to have_key :hourly
    expect(data).to have_key :daily
  end
  it "returns forecast data for atlanta", :vcr do
    get '/api/v1/forecast?location=atlanta+georgia'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:attributes]
    expect(data).to have_key :current
    expect(data).to have_key :details
    expect(data).to have_key :hourly
    expect(data).to have_key :daily
  end
  it "returns forecast data for anchorage", :vcr do
    get '/api/v1/forecast?location=anchorage'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:attributes]
    expect(data).to have_key :current
    expect(data).to have_key :details
    expect(data).to have_key :hourly
    expect(data).to have_key :daily
  end
  it "returns forecast data for sydney", :vcr do
    get '/api/v1/forecast?location=sydney,australia'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:attributes]
    expect(data).to have_key :current
    expect(data).to have_key :details
    expect(data).to have_key :hourly
    expect(data).to have_key :daily
  end
  it "returns error status", :vcr do
    get '/api/v1/forecast?location=1111111'

    expect(response).to_not be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:errors].first
    expect(data).to have_key :id
    expect(data).to have_key :title
  end
end
