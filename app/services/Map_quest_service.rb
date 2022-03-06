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
end