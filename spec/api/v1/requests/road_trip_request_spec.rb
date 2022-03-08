require 'rails_helper'
RSpec.describe "road trip request" do
  it "makes a request to plan a road trip", :vcr do
    user_1 = User.create!(email: "dave@gmail.com", password: "password")

    user_params =
    {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": user_1.api_key
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post "/api/v1/road_trip", headers: headers, params: user_params.to_json
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data][:type]).to eq("roadtrip")
    expect(parsed[:data][:attributes][:start_city]).to eq("Denver,CO")
    expect(parsed[:data][:attributes][:end_city]).to eq("Pueblo,CO")
    expect(parsed[:data][:attributes][:travel_time]).to eq("01:45:23")
    expect(parsed[:data][:attributes][:arrival_weather][:time]).to be_a(String)
    expect(parsed[:data][:attributes][:arrival_weather][:temperature]).to be_a(Float)
    expect(parsed[:data][:attributes][:arrival_weather][:conditions]).to be_a(String)
  end

  it "makes a request to plan a road trip(sad path bad api key)", :vcr do
    user_1 = User.create!(email: "dave@gmail.com", password: "password")

    user_params =
    {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "skjfnkjsnfsfjn"
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post "/api/v1/road_trip", headers: headers, params: user_params.to_json
    expect(response).to_not be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:status]).to eq("ERROR")
    expect(parsed[:message]).to eq("No Access - bad API key")
  end


  it "makes a request to plan a road trip(sad path impossible route)" do
    VCR.eject_cassette
    VCR.turn_off!
    WebMock.enable_net_connect!
    user_1 = User.create!(email: "dave@gmail.com", password: "password")

    user_params =
    {
      "origin": "Denver,CO",
      "destination": "Honolulu, HI",
      "api_key": user_1.api_key
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post "/api/v1/road_trip", headers: headers, params: user_params.to_json
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data][:attributes][:travel_time]).to eq("Impossible route.")
    expect(parsed[:data][:attributes][:travel_time]).to eq("No Data.")
  end
end