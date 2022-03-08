class Coordinate
  attr_reader :lat,
              :lon
  def initialize(data)
    @lat = data.first[:locations].first[:latLng][:lat]
    @lon = data.first[:locations].first[:latLng][:lng]
  end
end