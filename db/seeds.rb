# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

User.destroy_all

user1 = User.create(username: "pombo", email: "pombo@gmail.com", password: "pombinho222")
user2 = User.create(username: "pombito", email: "pombito@gmail.com", password: "pombinho222")

10.times do
  pigeon = Pigeon.create(name: Faker::Name.first_name, available: true, description: Faker::Creature::Bird.order, price_per_day: rand(5..20), user_id: user1.id)
  pigeon = Pigeon.create(name: Faker::Name.first_name, available: true, description: Faker::Compass.direction, price_per_day: rand(5..20), user_id: user1.id, address: "Conde Redondo, Lisboa")

  p pigeon.id
  5.times do
    booking = Booking.create(start_date: '01/01/2022', end_date: '02/01/2022', total_price: pigeon.price_per_day, pigeon_id: pigeon.id, user_id: user2.id)
    p booking.id
  end
end

# category: ["Send a gift", "Baby sitting", "Company", "Music", "Private Detective", "Magic Tricks", "Poop", "Birthday Party", "Special Ocasions"]
