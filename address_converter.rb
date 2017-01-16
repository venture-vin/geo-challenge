require 'rubygems'
require 'geokit'

def convert_address_to_coordinates(location)
  coords = Geokit::Geocoders::MultiGeocoder.geocode(location)
  return coords.lat, coords.lng
end
