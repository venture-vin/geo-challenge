
class Store
  attr_reader :store_name, :store_location, :address, :city, :state, :zip_code, :latitude, :longitude, :county

def initialize(args={})
  @store_name = args["store_name"]
  @store_location = args["store_location"]
  @address = args["address"]
  @city = args["city"]
  @state = args["state"]
  @zip_code = args["zip_code"]
  @latitude = args["latitude"]
  @longitude = args["longitude"]
  @county = args["county"]
end
