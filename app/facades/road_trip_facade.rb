class RoadTripFacade

  def self.new_road_trip(origin, destination)
    coords = MapQuestFacade.geocode(destination)
    route = MapQuestFacade.trip_route(origin, destination)
    destination_weather = WeatherFacade.forecast(coords)
    RoadTrip.new(destination_weather, route, origin, destination)
  end
end

