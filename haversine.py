
from math import sin, cos, sqrt, atan2, radians
import pdb

def distance(origin, destination):
  lat1, lon1 = origin
  lat2, lon2 = destination

  R = 6373.0 #km


  dlon = radians(lon2) - radians(lon1)
  dlat = radians(lat2) - radians(lat1)

  a = sin(dlat / 2)**2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon / 2)**2

  c = 2 * atan2(sqrt(a), sqrt(1 - a))

  d = R * c

  return d

