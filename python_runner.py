import csv


with open("store-locations.csv", "rU") as infile:
  reader = csv.DictReader(infile)
    # headers = reader.next()
  for row in infile:
    print row

