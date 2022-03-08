class Api::V1::ForecastController < ApplicationController

  def index
    coords = MapQuestFacade.geocode(params["location"])
    forecast = WeatherFacade.forecast(coords)
    render(json: ForecastSerializer.weather(forecast))
  end
end