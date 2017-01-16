require_relative 'store_parser'
require_relative 'address_converter'

all = parse_from_store_file('store-locations.csv')

puts convert_address_to_coordinates("1770 Union St, San Francisco, CA 94115")
puts all[0]

