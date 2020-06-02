# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

suburbs = %w[Brunswick Melbourne South\ Yarra Docklands South\ Melbourne Footscray];
booking_status = %w[confirmed cancelled renting]

# Sample Users
user = User.new(
  first_name: Faker::Name.unique.first_name,
  last_name: Faker::Name.unique.last_name,
  email: "simon.smith@cars.com",
  address: "Melbourne, AUS"
)
user.password = "abc123"
user.save!

# Sample Cars
10.times do
  car = Car.new(
    name: "#{Faker::Vehicle.manufacture} #{Faker::Vehicle.make_and_model}",
    year: rand(1900..1980),
    seats: rand(2..6),
    price: rand(50..100) + rand.floor(2),
    location: "#{suburbs.sample}, VIC, AUS"
  )
  car.user = user if rand(1..5) == 3
  car.save!
end

# Sample Booking
5.times do 
  booking = Booking.new(
    start_date: DateTime.now,
    end_date: DateTime.now + rand(1..7)
  )
  booking.user = user
  booking.car = Car.find(rand(Car.first.id..Car.last.id))
  booking.booking_price = (booking.end_date - booking.start_date) * booking.car.price
  booking.status = booking_status.sample
  booking.save!
end

# Sample Reviews -- placeholder
