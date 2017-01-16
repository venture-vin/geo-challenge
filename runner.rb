require_relative 'store_parser'
require_relative 'address_converter'
require 'geocoder'


def store_filter(address)
all = parse_from_store_file('store-locations.csv')
home = Geocoder.coordinates(address)
min_distance = 0

  all.each do |coord|
    destination = [coord[:latitude], coord[:longitude]]
    distance = Geocoder::Claculations.distance_between(destination, home)
    min_distance = distance
    opt_distance = [min_distance, distance].min
  end
# compare current location with other lat/longs
# if distance less than 1 mile return results
return opt_distance
end

# puts store_filter("1770 Union St, San Francisco, CA 94115")
