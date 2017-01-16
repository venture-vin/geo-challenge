require 'csv'

class StoreParser
  attr_reader :file

  def initialize(file)
    @file = file
    @collection = []
  end

  def stores
    if @stores
      return @stores
    else
      @stores = parse_from_store_file
    end
  end

  def make_store_objects
    parse_from_store_file
    @collection = stores.map {|store_args| Store.new(store_args)}
  end

  private
  def parse_from_store_file
    csv = CSV.open(@file, :headers => true)
    @collection = csv.to_a.map {|row| row.to_hash}
  end
end
