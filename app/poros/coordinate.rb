class Coordinate
  attr_reader :lat,
              :lon
  def initialize(data)
    @lat = data.first[:locations][-2][:latLng][:lat]
    @lon = data.first[:locations][-2][:latLng][:lng]
  end
end