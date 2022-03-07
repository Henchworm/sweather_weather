class Forecast
  attr_reader :id,
              :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(time_range_values)
    @id = nil
    @current_weather = current_formatter(time_range_values[:current_weather])
    @hourly_weather = hourly_formatter(time_range_values[:hourly_weather])
    @daily_weather = daily_formatter(time_range_values[:daily_weather])
    binding.pry
  end

  def current_formatter(data)
    {
      datetime: Time.at(data[:dt]),
      sunrise: Time.at(data[:sunrise]),
      sunset: Time.at(data[:sunset]),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humiditiy: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather].first[:description],
      conditions: data[:weather].first[:icon]
    }
  end

  def hourly_formatter(data)
    data.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime('%T'),
        temperature: hour[:temp].to_f,
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end

  def daily_formatter(data)
    data.map do |day|
    {
      date: Time.at(day[:dt]).strftime('%F'),
      sunrise: Time.at(day[:sunrise]),
      sunset: Time.at(day[:sunset]),
      max_temp: day[:temp][:max],
      min_temp: day[:temp][:min],
      conditions: day[:weather][0][:description],
      icon: day[:weather][0][:icon]
    }
    end
  end


# uvi, numeric (int or float), as given by OpenWeather
# visibility, numeric (int or float), as given by OpenWeather
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
end