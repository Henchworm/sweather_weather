require 'rails_helper'
RSpec.describe RoadTripFacade do
  it "create roadtrip object", :vcr do
    origin = "denver,co"
    destination = "pueblo,co"
    roadtrip = RoadTripFacade.new_road_trip(origin, destination)
    expect(roadtrip).to be_a(RoadTrip)
  end
end