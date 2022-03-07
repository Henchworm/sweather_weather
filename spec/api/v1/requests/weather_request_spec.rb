require 'rails_helper'
RSpec.describe "forecast requests" do
  it "returns JSON for weather at a determined location" do
    WebMock.enable_net_connect!
    VCR.turn_off!
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    binding.pry

  end
end