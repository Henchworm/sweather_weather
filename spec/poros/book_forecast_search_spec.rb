require 'rails_helper'
RSpec.describe BookForecastSearch do
  it "create a bookforecastsearch from other objects", :vcr do

    response = Faraday.get("http://openlibrary.org/search.json?q=denver,co&limit=5&details=true")
    data = JSON.parse(response.body, symbolize_names: true)

    book_search_1 = BookSearch.new(data)

    weather_data = {:datetime=>"2022-03-07 10:48:36 -0700",
                   :sunrise=>"2022-03-07 06:24:02 -0700",
                   :sunset=>"2022-03-07 17:58:07 -0700",
                   :temperature=> 25.92,
                   :feels_like=> 25.92,
                   :humidity=> 57,
                   :uvi=> 3.54,
                   :visibility=>"10000",
                   :conditions=>"snow",
                   :icon=>"13d"}
    search_params = "denver,co"

    book_forecast_search_1 = BookForecastSearch.new(book_search_1, weather_data, search_params)

    expect(book_forecast_search_1).to be_a(BookForecastSearch)
    expect(book_forecast_search_1.books).to be_an(Array)
    expect(book_forecast_search_1.destination).to eq("denver,co")
    expect(book_forecast_search_1.forecast).to be_a(Hash)
    expect(book_forecast_search_1.total_books_found).to be_an(Integer)
    expect(book_forecast_search_1.id).to eq(nil)
  end
end