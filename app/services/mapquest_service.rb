class MapQuestService

  def self.conn
   Faraday.new(url: 'http://www.mapquestapi.com') do |f|
     f.params['key'] = ENV['mapquest_key']
   end
 end

  def self.geocode(location)
    response = conn.get("/geocoding/v1/address?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.trip_route(origin, destination)
    response = conn.get("/directions/v2/route?&from=#{origin}&to=#{destination}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end