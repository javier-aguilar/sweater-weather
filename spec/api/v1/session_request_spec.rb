require 'rails_helper'

describe "API V1" do
  describe "POST /api/v1/sessions", type: :request do
    before do
      post '/api/v1/users', params: { email: "whatever@example.com", password: "password", password_confirmation: "password" }
    end
    it "returns successful and creates a user and generates a unique api key associated with that user" do
      post '/api/v1/sessions', params: { email: "whatever@example.com", password: "password" }

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:attributes]

      expect(data).to have_key :email
      expect(data).to have_key :api_key

      expect(data[:email]).to eq 'whatever@example.com'
    end
    it "returns unsuccessful due to wrong password" do
      post '/api/v1/sessions', params: { email: "whatever@example.com", password: "passw0rd" }

      expect(response).to_not be_successful
      expect(response).to have_http_status(401)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key :status
      expect(json).to have_key :code
      expect(json).to have_key :message

      expect(json[:message]).to eq 'Invalid Email or Password'
    end
  end
end
