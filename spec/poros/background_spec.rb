require 'rails_helper'
RSpec.describe Background do
  it "creates background poro", :vcr do
    location = "denver,co"
    data = UnsplashService.location_search(location)

    background_1 = Background.new(data)
    expect(background_1.credits[:username]).to be_a(String)
    expect(background_1.credits[:portfolio_link]).to be_a(String)
    expect(background_1.credits[:upsplash_link]).to be_a(String)
    expect(background_1.location).to eq("denver")
    expect(background_1.id).to eq(nil)
    expect(background_1.url).to be_a(String)
  end
end