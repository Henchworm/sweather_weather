require 'rails_helper'
RSpec.describe "book request" do

  it "gets books about the location searched", :vcr do
    # WebMock.enable_net_connect!
    # VCR.turn_off!
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data][:type]).to eq("books")

    expect(parsed[:data][:attributes][:forecast][:summary]).to eq("snow")
    expect(parsed[:data][:attributes][:forecast][:temperature]).to eq("25 F")


    expect(parsed[:data][:attributes][:total_books_found]).to eq(41867)
    expect(parsed[:data][:attributes][:books]).to be_an(Array)
    expect(parsed[:data][:attributes][:books].count).to eq(5)

    parsed[:data][:attributes][:books].each do |book|
      expect(book[:isbn]).to be_an(Array)
      expect(book[:title]).to be_a(String)
      expect(book[:publisher]).to be_an(Array)
    end
  end
end