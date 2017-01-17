# Strategy
I looked up what geocoding gems or APIs are out there, and came up with two that I wanted to try. I then knew I need to parse the csv file, so that data can be manipulated and compared. I thought about what would be the easiest way to compare data, and decided that if I have latitudes and longitudes given the gem's that I found, I will be able to find distances between initial location and destination. Once I found all of the distances, I put them in an array, which would be easy to sort through and find the min distance. 

Some caveats: I originally tried to use an API gem that wasn't returning the proper results and had to debug to come to a different solution. Additionally, I tried to implement with classes but kept getting empty string returns, so figured methods will work just as fine without a class wrapper. I like using classes and modules because they make things a lot cleaner, but figure this is an initial solution that works and could be improved upon and updated. 

I would like to implement this into a simple App either with Rails or React, for a nice front-end UI effects. 

## Assumptions
* The user input will be a string that will include enough information for Geocode converter to retrieve latitude and longitude
* The minimum distance between coordinates is not always necessarily the best, due to the way actual route may go, so assuming the linear minimum distance will still be a fairly accurate representation of the closest location
* Distance will not be negative

# Instructions
* Download the repo 
* Install ruby on your machine - for instructions [click here](https://www.ruby-lang.org/en/documentation/installation/)
* In the terminal type: gem install geocoder
* In the terminal type: ruby runner.rb
* After the prompt input the address
* Voila!
