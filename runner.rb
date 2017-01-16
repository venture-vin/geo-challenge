require_relative 'stores'
require_relative 'store_parser'

parser = StoreParser.new('store-locations.csv')
stores = parser.make_store_objects

