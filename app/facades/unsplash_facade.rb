class UnsplashFacade

  def self.location_photo(location)
    response = UnsplashService.location_search(location)
    Background.new(response)
  end
end