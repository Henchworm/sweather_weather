class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :arrival_weather
  def initialize(destination_weather, route, origin, destination)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = route[:route][:formattedTime]
    @arrival_weather = arrival_weather_formatter(destination_weather, travel_time)
  end

  def arrival_weather_formatter(destination_weather, travel_time)
    arrival_time = DateTime.now + ((travel_time[0] + travel_time[1]).to_i.hours + (travel_time[3] + travel_time[4]).to_i.minutes)
    hourly_weather = destination_weather.hourly_weather.find_all do |hour|
      arrival_time.strftime("%H").to_i == (hour[:time].to_datetime).strftime("%H").to_i
    end
    hourly_weather.first.except!(:icon)
  end
end