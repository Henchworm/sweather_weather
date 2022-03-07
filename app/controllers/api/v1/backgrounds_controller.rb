class Api::V1::BackgroundsController < ApplicationController

  def index
    photo_details = UnsplashFacade.location_photo(params["location"])

    render(json: BackgroundSerializer.new(photo_details))
  end
end