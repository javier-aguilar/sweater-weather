require 'rails_helper'

describe "API V1" do
  describe "POST /api/v1/users", type: :request do
    it "returns successful and creates a user and generates a unique api key associated with that user" do
      post '/api/v1/users', params: { email: "whatever@example.com", password: "password", password_confirmation: "password" }

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:attributes]

      expect(data).to have_key :email
      expect(data).to have_key :api_key
    end
    it "returns unsuccessful due to missing email" do
      post '/api/v1/users', params: { email: "", password: "password", password_confirmation: "password" }

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key :status
      expect(json).to have_key :code
      expect(json).to have_key :message

      expect(json[:message]).to eq "Email can't be blank"
    end
    it "returns unsuccessful due to already existing email" do
      post '/api/v1/users', params: { email: "user@example.com", password: "password", password_confirmation: "password" }
      post '/api/v1/users', params: { email: "user@example.com", password: "password", password_confirmation: "password" }

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key :status
      expect(json).to have_key :code
      expect(json).to have_key :message

      expect(json[:message]).to eq "Email has already been taken"
    end
    it "returns unsuccessful due to missing password" do
      post '/api/v1/users', params: { email: "user@example.com", password: "", password_confirmation: "password" }

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key :status
      expect(json).to have_key :code
      expect(json).to have_key :message

      expect(json[:message]).to eq "Password can't be blank and Password can't be blank"
    end
    it "returns unsuccessful due to mismatched passwords" do
      post '/api/v1/users', params: { email: "user@example.com", password: "password1", password_confirmation: "password" }

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key :status
      expect(json).to have_key :code
      expect(json).to have_key :message

      expect(json[:message]).to eq "Password confirmation doesn't match Password"
    end
  end
end
