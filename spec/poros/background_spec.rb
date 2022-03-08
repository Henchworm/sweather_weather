require 'rails_helper'
RSpec.describe Background do
  it "creates background poro", :vcr do
    location = "denver,co"
    data = UnsplashService.location_search(location)

    background_1 = Background.new(data)
    expect(background_1.credits[:username]).to eq("mirandafayj")
    expect(background_1.credits[:portfolio_link]).to eq("http://www.mirandafayj.com")
    expect(background_1.credits[:upsplash_link]).to eq("https://api.unsplash.com/photos/lkLTeBY2SZE")
    expect(background_1.location).to eq("denver")
    expect(background_1.id).to eq(nil)
    expect(background_1.url).to eq( "https://images.unsplash.com/photo-1511286148006-ec48824e3282?ixid=MnwzMDc4ODF8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3NreWxpbmV8ZW58MHx8fHwxNjQ2NzEzMzcx&ixlib=rb-1.2.1")
  end
end