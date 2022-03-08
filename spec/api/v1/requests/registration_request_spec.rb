require 'rails_helper'
RSpec.describe "user registration" do

  it "registers a user from request(happy path PW match)" do
    user_params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes]).to have_key(:api_key)
  end

  it "registers a user from request(sad path no PW match)" do
    user_params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password20"
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to_not be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:status]).to eq(400)
    expect(parsed[:message]).to eq("Password confirmation doesn't match Password")
  end

  it "registers a user from request(sad path no pw both fields blank)" do
    user_params = {
      "email": "whatever@example.com",
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to_not be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:status]).to eq(400)
    expect(parsed[:message]).to eq("Password digest can't be blank and Password can't be blank")
  end


    it "registers a user from request(sad path no pw password field blank)" do
      user_params = {
        "email": "whatever@example.com",
        "password_confirmation": "password20"
      }
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
      post '/api/v1/users', headers: headers, params: user_params.to_json

      expect(response).to_not be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:status]).to eq(400)
      expect(parsed[:message]).to eq("Password digest can't be blank and Password can't be blank")
    end

    it "registers a user from request(sad path no pw password field blank)" do
      user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": " "
      }
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
      post '/api/v1/users', headers: headers, params: user_params.to_json

      expect(response).to_not be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:status]).to eq(400)
      expect(parsed[:message]).to eq("Password confirmation doesn't match Password")
    end

    it "registers a user from request(sad path duplicate user)" do
      user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
      post '/api/v1/users', headers: headers, params: user_params.to_json

      post '/api/v1/users', headers: headers, params: user_params.to_json

      expect(response).to_not be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:status]).to eq(400)
      expect(parsed[:message]).to eq("Email has already been taken")
    end
end