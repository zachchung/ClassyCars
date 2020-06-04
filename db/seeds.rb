require 'faker'
require "open-uri"

puts "--- Starting populating database"
suburbs = %w[Brunswick Melbourne South\ Yarra Docklands South\ Melbourne Footscray Richmond Fitzroy Carlton Collingwood St\ Kilda Kensington windsor malvern hawthorn];
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


car = Car.create!(
  name: "Le Wagon",
  year: 2013,
  seats: 11,
  price: rand(50..100) + rand.floor(2),
  location: "#{suburbs.sample}, AU",
  user_id: users.sample.id,
  )
file1 = URI.open('https://vistapointe.net/images/vw-minibus-1.jpg')
file2 = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/idbuzz1a-1503162755.jpg')
file3 = URI.open('https://i.pinimg.com/originals/6c/5c/9e/6c5c9e9cab007bcd91e699d0be2bb179.jpg')
car.photos.attach(io: file1, filename: 'car1.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')

car = Car.create!(
  name: "Batmobile",
  year: 2046,
  seats: 1,
  price: rand(50..100) + rand.floor(2),
  location: "#{suburbs.sample}, AU",
  user_id: users.sample.id,
  # image: "batmobile.jpg"
  )
file1 = URI.open('https://postmediadriving.files.wordpress.com/2018/02/tumbler-batmobile-replica.jpg')
file2 = URI.open('https://rocketeers.gg/wp-content/uploads/2018/02/batmobile-89.jpg')
file3 = URI.open('https://cdn.i-scmp.com/sites/default/files/d8/images/methode/2020/02/27/a5af0b88-58d2-11ea-b438-8452af50d521_image_hires_043702.jpg')
car.photos.attach(io: file1, filename: 'car1.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')
# car.user = users.sample
# car.save!

car = Car.create!(
  name: "Mario Kart",
  year: 1990,
  seats: 1,
  price: rand(50..100) + rand.floor(2),
  location: "#{suburbs.sample}, AU",
  user_id: users.sample.id,
  )
file1 = URI.open('https://cdn.vox-cdn.com/thumbor/WXaYJI47OmpEBPs2490y3OVQ6OM=/0x0:1920x1158/1200x800/filters:focal(612x320:918x626)/cdn.vox-cdn.com/uploads/chorus_image/image/63881293/WiiU_MK8_artwork_07__1_.0.jpg')
file2 = URI.open('https://cdn.mos.cms.futurecdn.net/PZxivc49eWes8DQtpnnW7d.jpg')
file3 = URI.open('https://ryutokyo.com/wp-content/uploads/2019/07/cropped-mariokart2-1-scaled.jpg')
car.photos.attach(io: file1, filename: 'car1.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')

car = Car.create!(
  name: "Bentley EXP 100",
  year: 2020,
  seats: 2,
  price: rand(50..100) + rand.floor(2),
  location: "#{suburbs.sample}, AU",
  user_id: users.sample.id,
  )
file1 = URI.open('https://image.cnbcfm.com/api/v1/image/106010244-1562708838619bencon-1.jpg?v=1562708869')
file2 = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/exp-100-gt-9th-july-13-1562756469.jpg')
car.photos.attach(io: file1, filename: 'car1.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')

car = Car.create!(
  name: "Tesla Cybertruck",
  year: 2022,
  seats: 6,
  price: rand(50..100) + rand.floor(2),
  location: "#{suburbs.sample}, AU",
  user_id: users.sample.id,
  )
file1 = URI.open('https://i.insider.com/5dd85153fd9db24cee2399db?width=1065&format=jpeg')
# file2 = URI.open('https://www.tesla.com/xNVh4yUEc3B9/10_Desktop.jpg')
file3 = URI.open('https://cdn.motor1.com/images/mgl/jyq8l/s1/tesla-cybertruck-colors.jpg')
car.photos.attach(io: file1, filename: 'car1.jpeg', content_type: 'image/jpeg')
# car.photos.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')
car.photos.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')


# car = Car.create!(
#   name: "",
#   year: 1990,
#   seats: 1,
#   price: rand(50..100) + rand.floor(2),
#   location: "#{suburbs.sample}, AU",
#   user_id: users.sample.id,
#   )
# file1 = URI.open('')
# file2 = URI.open('')
# file3 = URI.open('')
# car.photos.attach(io: file1, filename: 'car1.jpeg', content_type: 'image/jpeg')
# car.photos.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')
# car.photos.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')


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
    start_date: Date.today + rand(30..40),
    end_date: Date.today + rand(41..50)
  )
  booking.user = users.sample
  booking.car = Car.find(rand(Car.first.id..Car.last.id))
  booking.booking_price = (booking.end_date - booking.start_date) * booking.car.price
  booking.status = booking_status.sample
  booking.save!
end
puts "Finished generated Booking ---"

# Sample Reviews -- placeholder
