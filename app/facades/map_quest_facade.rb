class MapQuestFacade
  def self.geocode(location)
    data = MapQuestService.geocode(location)
    Coordinate.new(data[:results])
  end
end