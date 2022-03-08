require 'rails_helper'
RSpec.describe RoadTrip do

  it "creates a roadtrip from multiple data types happy path", :vcr do
    origin = "denver,co"
    destination = "pueblo,co"
    roadtrip = RoadTripFacade.new_road_trip(origin, destination)
    expect(roadtrip).to be_a(RoadTrip)
    expect(roadtrip.arrival_weather).to be_a(Hash)
    expect(roadtrip.end_city).to eq("pueblo,co")
    expect(roadtrip.start_city).to eq("denver,co")
    expect(roadtrip.travel_time).to eq("01:45:23")
  end

  it "creates a roadtrip from multiple data types sad path", :vcr do
    origin = "denver,co"
    destination = "honolulu,hi"
    roadtrip = RoadTripFacade.new_road_trip(origin, destination)
    expect(roadtrip).to be_a(RoadTrip)
    expect(roadtrip.arrival_weather).to eq("No Data.")
    expect(roadtrip.travel_time).to eq("Impossible route.")
  end
end