require 'rails_helper'
RSpec.describe "book request" do

  it "gets books about the location searched" do
    WebMock.enable_net_connect!
    VCR.turn_off!
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data][:id]).to eq(nil)

    binding.pry
  end
end