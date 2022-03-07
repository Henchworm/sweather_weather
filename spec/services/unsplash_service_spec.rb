require 'rails_helper'
RSpec.describe UnsplashService do
  it "gets a photo based on search criteria", :vcr do
    location = "denver, co"
    response = UnsplashService.location_search(location)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
  end
end