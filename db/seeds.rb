# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'

airport_codes = [
    "JFK",
    "LHR",
    "CDG",
    "HND",
    "SYD",
    "MUC",
  ]

#Airport.delete_all

#airport_codes.each do |code|
#    Airport.create( code: code )
#end


  #airports = Airport.all.shuffle
  #3.times do
  #  date = Flight.all.sample.date
   # duration = rand(15..30) * 100
   # Flight.create( departing_airport: airports.pop, arrival_airport: airports.pop, date: date, duration: duration )
  #end

  Booking.delete_all
  Passenger.delete_all
