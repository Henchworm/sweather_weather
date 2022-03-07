class BookForecastSearch
  attr_reader :id,
              :total_books_found,
              :forecast,
              :books,
              :destination
  def initialize(book_data, weather_data, search_param)
    @id = nil
    @destination = search_param
    @total_books_found = book_data.total_books_found
    @forecast = forecast_formatter(weather_data)
    @books = book_data.books
  end

  def forecast_formatter(weather_data)
    {
      summary: weather_data[:conditions],
      temperature: weather_data[:temperature].round(1).to_i.to_s + " F"
    }
  end
end