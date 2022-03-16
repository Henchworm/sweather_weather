# require 'rails_helper'
# RSpec.describe MapQuestService do
#   xit "returnsgeocoded data for city", :vcr do
#     data = "denver,co"
#     response = MapQuestService.geocode(data)
#
#     expect(response).to be_a(Hash)
#     response[:results].each do |result|
#       expect(result[:locations].first[:displayLatLng]).to eq({:lat=>39.738453, :lng=>-104.984853})
#     end
#   end
# end