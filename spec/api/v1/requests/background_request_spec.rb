require 'rails_helper'
RSpec.describe "request for background image" do
  it "returns JSON response with image details", :vcr do
    get "/api/v1/backgrounds?location=denver,co"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data][:type]).to eq("background")
    expect(parsed[:data][:attributes][:description]).to eq("Blue Bear Looking In")
    expect(parsed[:data][:attributes][:location]).to eq("denver")
    expect(parsed[:data][:attributes][:url]).to eq("https://images.unsplash.com/photo-1511286148006-ec48824e3282?ixid=MnwzMDc4ODF8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3NreWxpbmV8ZW58MHx8fHwxNjQ2NzEzMzcx&ixlib=rb-1.2.1")
    expect(parsed[:data][:attributes][:credits][:username]).to eq("mirandafayj")
    expect(parsed[:data][:attributes][:credits][:portfolio_link]).to eq("http://www.mirandafayj.com")
    expect(parsed[:data][:attributes][:credits][:upsplash_link]).to eq("https://api.unsplash.com/photos/lkLTeBY2SZE")
  end
end