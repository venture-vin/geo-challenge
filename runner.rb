require_relative 'store_parser'
require_relative 'address_converter'


def store_filter(address)
all = parse_from_store_file('store-locations.csv')
home = convert_address_to_coordinates(address).join(',')
current_address = Geokit::LatLng.new(home)
min_distance = 0

  all.each do |x, y|
    destination = '#{x[:latitude]}, #{y[:longitude]}'
    distance = current_address.distance_to(destination)
    min_distance = distance
    opt_distance = [min_distance, distance].min
  end
# compare current location with other lat/longs
# if distance less than 1 mile return results
return opt_distance
end

# puts store_filter("1770 Union St, San Francisco, CA 94115")
