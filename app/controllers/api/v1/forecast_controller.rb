class Api::V1::ForecastController < ApplicationController
  def index
    coords = MapQuestFacade.geocode(params["location"])
    forecast = WeatherFacade.forecast(coords)
  end
end