import csv

import geocoder

import haversine

def nearest_distance(origin):
  g = geocoder.google(origin)
  input = g.latlng
  lat1 = float(input[0])
  lon1 = float(input[1])

  min_distance = float("inf")
  counter = 0
  smallest_index = 0

  with open("store-locations.csv", "rU") as infile:

    reader = csv.DictReader(infile, delimiter=",")
    converted_reader = list(reader)

    for row in converted_reader:
      lat2 = float(row["Latitude"])
      lon2 = float(row["Longitude"])
      distance = (haversine.distance((lat1, lon1), (lat2, lon2)))

      if distance < min_distance:
        min_distance = distance
        smallest_index = counter
      counter += 1

    address = converted_reader[smallest_index]["Address"]
    city = converted_reader[smallest_index]["City"]
    state = converted_reader[smallest_index]["State"]
    zip_code = converted_reader[smallest_index]["Zip Code"]

    return "%(address)s, %(city)s, %(state)s %(zip_code)s" % locals()




print nearest_distance("1700 Union St, San Francisco, CA")
