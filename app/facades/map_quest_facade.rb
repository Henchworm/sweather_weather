class MapQuestFacade

  def self.geocode(location)
    data = MapQuestService.geocode(location)
    Coordinate.new(data[:results])
  end

  def self.trip_route(origin, destination)
    data = MapQuestService.trip_route(origin, destination)
  end
end