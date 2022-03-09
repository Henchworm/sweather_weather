require 'rails_helper'
RSpec.describe "forecast requests" do
  it "returns JSON for weather at a determined location", :vcr do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    parsed = JSON.parse(response.body)
    binding.pry

    expect(parsed["data"]["id"]).to eq(nil)
    expect(parsed["data"]["attributes"]).to be_a(Hash)
    expect(parsed["data"]["attributes"]).to have_key("current_weather")
    expect(parsed["data"]["attributes"]).to have_key("daily_weather")
    expect(parsed["data"]["attributes"]).to have_key("hourly_weather")
  end

  it "json details for current, daily and hourly weather details", :vcr do

    get "/api/v1/forecast?location=denver,co"

    parsed = JSON.parse(response.body)

    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("datetime")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("sunrise")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("sunset")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("temperature")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("feels_like")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("humidity")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("uvi")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("visibility")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("conditions")
    expect(parsed["data"]["attributes"]["current_weather"]).to have_key("icon")

    expect(parsed["data"]["attributes"]["daily_weather"]).to be_an(Array)
    expect(parsed["data"]["attributes"]["daily_weather"].length).to eq(5)
    parsed["data"]["attributes"]["daily_weather"].each do |day|
      expect(day).to have_key("date")
      expect(day).to have_key("sunrise")
      expect(day).to have_key("sunset")
      expect(day).to have_key("max_temp")
      expect(day).to have_key("min_temp")
      expect(day).to have_key("conditions")
      expect(day).to have_key("icon")
    end

    expect(parsed["data"]["attributes"]["hourly_weather"]).to be_an(Array)
    parsed["data"]["attributes"]["hourly_weather"].each do |hour|
      expect(hour).to have_key("time")
      expect(hour).to have_key("temperature")
      expect(hour).to have_key("conditions")
      expect(hour).to have_key("icon")
    end
  end
end