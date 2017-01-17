require_relative 'store_parser'
require 'geocoder'


def store_filter(address)
  all = parse_from_store_file('store-locations.csv')
  home = Geocoder.coordinates(address)


  min_distance = Float::INFINITY
  counter = 0
  smallest_index = 0


  all.each do |coord|

    destination = [coord[:latitude], coord[:longitude]]
    distance = Geocoder::Calculations.distance_between(destination, home)
    if distance < min_distance
      min_distance = distance
      smallest_index = counter
    end
    counter += 1
  end

  return "#{all[smallest_index][:address]} #{all[smallest_index][:state]} #{all[smallest_index][:zip_code]}"

end

puts "Please type in an address and we'll find the nearest store!"
address = gets.chomp

puts "The nearest store is at address: #{store_filter(address)}"
