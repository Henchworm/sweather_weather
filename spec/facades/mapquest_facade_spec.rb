require 'rails_helper'
RSpec.describe MapQuestFacade do
  it "geocodes", :vcr do
    location = "denver,co"
    geocoded = MapQuestFacade.geocode(location)
    expect(geocoded).to be_a(Coordinate)
  end

  it "trip routes", :vcr do
    origin = "denver,co"
    destination = "pueblo, co"
    result = MapQuestFacade.trip_route(origin, destination)
    expect(result).to be_a(Hash)
  end
end