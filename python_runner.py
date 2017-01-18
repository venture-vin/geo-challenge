import csv

import geocoder

import haversine

def nearest_distance(origin):
  g = geocoder.google(origin)
  input = g.latlng
  lat1 = float(input[0])
  lon1 = float(input[1])

  min_distance = float("inf")
  smallest_index = 0

  with open("store-locations.csv", "rU") as infile:

    reader = csv.DictReader(infile, delimiter=",")

    for counter, row in enumerate(reader):
      lat2 = float(row["Latitude"])
      lon2 = float(row["Longitude"])
      distance = (haversine.distance((lat1, lon1), (lat2, lon2)))

      if distance < min_distance:
        min_distance = distance
        smallest_index = counter

    address = reader[smallest_index]["Address"]
    city = reader[smallest_index]["City"]
    state = reader[smallest_index]["State"]
    zip_code = reader[smallest_index]["Zip Code"]

    ## WHOA! A read-world usage of locals()!!! How on earth did you end up using that?!?! Super cool, although at the same time totally insane ;)
    return "%(address)s, %(city)s, %(state)s %(zip_code)s" % locals()




print nearest_distance("1700 Union St, San Francisco, CA")
