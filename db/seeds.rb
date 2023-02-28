# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

User.destroy_all

user_1 = User.create(email: "pombo@gmail.com", password: "pombinho222")
user_2 = User.create(email: "margarida.bel.rita@gmail.com", password: "pombinho222")

10.times do
  Pigeon.create(name: Faker::Name.name, available: true, description: Faker::Quote.yoda, price_per_day: rand(5..20), user_id: user_1.id)
end
