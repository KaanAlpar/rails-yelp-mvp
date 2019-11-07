# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES = %w(japanese chinese belgian french italian)

puts "Creating 5 restaurants..."
5.times do
  rest = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number, category: CATEGORIES.sample)
  p rest
  rest.save!
end
puts "Finished creating 5 restaurants..."

puts "Creating a lot of reviews..."
Restaurant.all.each do |restaurant|
  (5..10).to_a.sample.times do
    review = Review.new(content: Faker::Books::Lovecraft.paragraph(sentence_count: (3..10).to_a.sample), rating: (0..5).to_a.sample)
    review.restaurant = restaurant
    review.save!
    p review
  end
end
puts "Finished creating a lot of reviews..."
