require 'faker'

puts "--- Starting populating database"
suburbs = %w[Brunswick Melbourne South\ Yarra Docklands South\ Melbourne Footscray];
booking_status = %w[confirmed cancelled returned renting]

# Sample Users
puts "--- Generate User"

user = User.create!(
  first_name: "Zach",
  last_name: "Chung",
  email: "zach@cars.com",
  address: "Melbourne, AUS",
  password: "123123"
  )

second_user = User.new(
  first_name: "Erik",
  last_name: "Tran",
  email: "erik@cars.com",
  address: "Brunswick, Melbourne, AUS",
)
second_user.password = "abc123"
second_user.save!

third_user = User.new(
  first_name: "Harshil",
  last_name: "Siyani",
  email: "harshil@cars.com",
  address: "Melbourne, AUS",
)
third_user.password = "abc123"
third_user.save!
puts "Finished generated User ---"


# Sample Cars
puts "--- Generate Car"
users = User.all
10.times do
  car = Car.new(
    name: "#{Faker::Vehicle.make_and_model}",
    year: rand(1900..1980),
    seats: rand(2..6),
    price: rand(50..100) + rand.floor(2),
    location: "#{suburbs.sample}, VIC, AU"
  )
  # 1 Car always belong to 1 User, 1 User may not own a Car
  car.user = users.sample
  car.save!
end
puts "Finished generated Car ---"

# Sample Booking
puts "--- Generate Booking"
5.times do
  booking = Booking.new(
    start_date: Date.today,
    end_date: Date.today + rand(1..7)
  )
  booking.user = users.sample
  booking.car = Car.find(rand(Car.first.id..Car.last.id))
  booking.booking_price = (booking.end_date - booking.start_date) * booking.car.price
  booking.status = booking_status.sample
  booking.save!
end
puts "Finished generated Booking ---"

# Sample Reviews -- placeholder
