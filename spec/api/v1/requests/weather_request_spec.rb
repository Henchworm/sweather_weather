require 'rails_helper'
RSpec.describe "background requests" do
  it "returns JSON for weather at a determined location" do
    WebMock.enable_net_connect!
    VCR.turn_off!
    get "/api/v1/forecast?location=denver,co"

    expect(response.status).to be(successful)

  end
end