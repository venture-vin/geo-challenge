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
    print smallest_index
    print len(converted_reader)
    print min_distance
    return converted_reader[smallest_index]


print nearest_distance("1700 Union St, San Francisco, CA")
