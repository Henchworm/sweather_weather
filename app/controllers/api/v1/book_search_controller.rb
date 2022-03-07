class Api::V1::BookSearchController < ApplicationController

  def index
    coords = MapQuestFacade.geocode(params["location"])
    forecast = WeatherFacade.forecast(coords)
    book_search = BookSearchFacade.search(params[:location], params[:quantity], forecast)
    book_forecast_search = BookForecastSearch.new(book_search, forecast.current_weather, params["location"])
    render(json: BookForecastSearchSerializer.new(book_forecast_search))
  end
end