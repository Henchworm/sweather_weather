require 'rails_helper'
RSpec.describe "request for background image" do
  it "returns JSON response with image details", :vcr do
    get "/api/v1/backgrounds?location=denver,co"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data][:type]).to eq("background")
    expect(parsed[:data][:attributes][:description]).to be_a(String)
    expect(parsed[:data][:attributes][:location]).to be_a(String)
    expect(parsed[:data][:attributes][:url]).to be_a(String)
    expect(parsed[:data][:attributes][:credits][:username]).to be_a(String)
    expect(parsed[:data][:attributes][:credits][:portfolio_link]).to be_a(String)
    expect(parsed[:data][:attributes][:credits][:upsplash_link]).to be_a(String)
  end
end