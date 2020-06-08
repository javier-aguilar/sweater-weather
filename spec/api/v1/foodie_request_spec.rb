require 'rails_helper'

describe "API V1" do
  describe "GET /api/v1/foodie" do
    it "returns food and forecast information for a city" do
      get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:attributes]
      expect(data).to have_key :end_location
      expect(data).to have_key :travel_time
      expect(data).to have_key :forecast
      expect(data).to have_key :restaurant
    end
  end
end

# {
#   "data": {
#     "id": "null",
#     "type": "foodie",
#     "attributes": {
#       "end_location": "pueblo,co",
#       "travel_time": "1 hours 48 min",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "restaurant": {
#         "name": "Angelo's Pizza Parlor",
#         "address": "105 E Riverwalk, Pueblo 81003"
#       }
#     }
#   }
# }
