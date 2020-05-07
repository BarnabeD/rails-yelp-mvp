# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all
puts "Creating restaurants..."
# puts "Nom au pif #{Faker::Restaurant.name}"
categories = ["chinese", "italian", "japanese", "french", "belgian"]
50.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories[rand(0..4)]
    )
  puts "-> created restaurant #{restaurant.id} :#{restaurant.name}"
  count = rand(1..5)
  count.times do
    review = Review.create(
      restaurant_id: restaurant.id,
      content: Faker::Lorem.sentences(number: 1)[0],
      rating: rand(0..5)
      )
    puts "--> created review for #{restaurant.name}"
  end
end
puts '----------------------------------'
puts "Total : #{Restaurant.count} restaurant created"
puts "Total : #{Review.count} reviews created"

