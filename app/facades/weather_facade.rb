class WeatherFacade
  def self.forecast(coords)
    response = WeatherService.get_forecast(coords)

    time_range_values = {
      current_weather: response[:current],
      hourly_weather: response[:hourly].first(8),
      daily_weather: response[:daily].first(5)
    }
    Forecast.new(time_range_values)
  end
end