require 'csv'

def parse_from_store_file(file)
  collection = []
  csv = CSV.open(file, :headers => true, :header_converters => :symbol, :converters => :all)
  collection = csv.to_a.map {|row| row.to_hash}
  return collection
end

