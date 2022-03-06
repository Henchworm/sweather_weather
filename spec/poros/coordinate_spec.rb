require 'rails_helper'
RSpec.describe "Coordinate Poro" do
  it "takes JSON response and create ruby object" do
    data = [
   {:providedLocation=>{:location=>"denver,co"},
    :locations=>
   [{:street=>"",
     :adminArea6=>"",
     :adminArea6Type=>"Neighborhood",
     :adminArea5=>"Denver",
     :adminArea5Type=>"City",
     :adminArea4=>"Denver County",
     :adminArea4Type=>"County",
     :adminArea3=>"CO",
     :adminArea3Type=>"State",

     :adminArea1=>"US",
     :adminArea1Type=>"Country",
     :postalCode=>"",
     :geocodeQualityCode=>"A5XAX",
     :geocodeQuality=>"CITY",
     :dragPoint=>false,
     :sideOfStreet=>"N",
     :linkId=>"282041090",
     :unknownInput=>"",
     :type=>"s",
     :latLng=>{:lat=>39.738453, :lng=>-104.984853},
     :displayLatLng=>{:lat=>39.738453, :lng=>-104.984853},
     :mapUrl=>
      "http://www.mapquestapi.com/staticmap/v5/map?key=ERsN8MepXYCIcFKsTwHRDP5muyWI5wPJ&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50
318A-1&scalebar=true&zoom=12&rand=-964167501"},
    {:street=>"",
     :adminArea6=>"",
     :adminArea6Type=>"Neighborhood",
     :adminArea5=>"",
     :adminArea5Type=>"City",
     :adminArea4=>"Denver County",
     :adminArea4Type=>"County",
     :adminArea3=>"CO",
     :adminArea3Type=>"State",
     :adminArea1=>"US",
     :adminArea1Type=>"Country",
     :postalCode=>"",
     :geocodeQualityCode=>"A4XAX",
     :geocodeQuality=>"COUNTY",
     :dragPoint=>false,
     :sideOfStreet=>"N",
     :linkId=>"282932003",
     :unknownInput=>"",
     :type=>"s",
     :latLng=>{:lat=>39.738453, :lng=>-104.984853},
     :displayLatLng=>{:lat=>39.738453, :lng=>-104.984853},
     :mapUrl=>
      "http://www.mapquestapi.com/staticmap/v5/map?key=ERsN8MepXYCIcFKsTwHRDP5muyWI5wPJ&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50
      318A-2&scalebar=true&zoom=9&rand=-1649683571"}]}]
  coord_1 = Coordinate.new(data)

  expect(coord_1).to be_a(Coordinate)
  expect(coord_1.lat).to eq(39.738453)
  expect(coord_1.lon).to eq(-104.984853)
  end
end