require_relative 'store_parser'
require 'geocoder'


def store_filter(address)
all = parse_from_store_file('store-locations.csv')
home = Geocoder.coordinates(address)
distances = []

  all.each_with_index do |coord, index|
    address = coord[:address]
    state = coord[:state]
    destination = [coord[:latitude], coord[:longitude]]
    distance = Geocoder::Calculations.distance_between(destination, home)
    distances << distance
  end

  index = distances.rindex(distances.min)
  return "#{all[index][:address]} #{all[index][:state]} #{all[index][:zip_code]}"

# compare current location with other lat/longs
# if distance less than 1 mile return results
end

puts "Please type in an address and we'll find the nearest store!"
address = gets.chomp

puts "The nearest store is at address: #{store_filter(address)}"
