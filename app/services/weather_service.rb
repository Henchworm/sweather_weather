class WeatherService

  def self.conn
  Faraday.new(url: 'https://api.openweathermap.org') do |f|
    f.params['appid'] = ENV['weather_key']
  end
end

  def self.get_forecast(coords)
    response = conn.get("/data/2.5/onecall?lat=#{coords.lat}&lon=#{coords.lon}&units=imperial")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end