require 'rails_helper'

describe "API V1" do
  describe "POST /api/v1/users", type: :request do
    it "returns successful and creates a user and generates a unique api key associated with that user", :vcr do
      post '/api/v1/users', params: { email: "whatever@example.com", password: "password", password_confirmation: "password" }


      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

    end
  end
end
