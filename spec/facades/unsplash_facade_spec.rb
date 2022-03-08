require 'rails_helper'
RSpec.describe UnsplashFacade do
  it ' makes image object', :vcr do
    image = UnsplashFacade.location_photo('Denver, CO')

    expect(image).to be_a(Background)
  end
end