# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying seed files..."
Bid.destroy_all
Tender.destroy_all
Business.destroy_all
User.destroy_all
Category.destroy_all

puts "Destroyed!"

puts "Seeding Project"

puts "Creating categories..."

CATEGORIES = %w(gin sake tequila tonic\ water white\ wine red\ wine spritzer)

CATEGORIES.each do |category|
  Category.create!(description: category)
end

puts "Creating bars..."
bar1 = User.create!(email:"test1@test.com",password:"password",user_type: "bar")
bar2 = User.create!(email:"test2@test.com",password:"password",user_type: "bar")
puts "Creating vendors..."
vendor1 = User.create!(email:"test3@test.com",password:"password",user_type: "vendor")
vendor2 = User.create!(email:"test4@test.com",password:"password",user_type: "vendor")

puts "Creating businesses..."
be_at_one = Business.create!(name: "Be At One", description: "Cocktail bar", location: "London", number_of_venues: 15, user_id: User.first.id, image_url: "https://raw.githubusercontent.com/raeesahub/eztenda-files/master/beatone.png")
ping_pong = Business.create!(name: "Ping Pong", description: "Dim sum restaurant",
location: "London", number_of_venues: 5, user_id: User.first.id, image_url: "https://d3atsf3fgek2rw.cloudfront.net/content/uploads/2013/06/Unknown8.jpeg")

las_iguanas = Business.create!(name: "Las Iguanas", description: "Eat Latin, Drink Latin",location: "London", number_of_venues: 9, user_id: User.first.id, image_url: "https://www.regent-court.co.uk/wp-content/uploads/2018/01/las-iguanas.png
")

eat_tokyo = Business.create!(name: "Eat Tokyo", description: "Japanese restaurant", location: "London", number_of_venues: 2, user_id: User.first.id, image_url: "https://github.com/raeesahub/eztenda-files/blob/master/eattokyo.png?raw=true
")


puts "Creating tenders..."
tender1 = Tender.create!(
  description: "Gin",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,3,21),
  volume: "1000",
  active: true,
  min_bid: "£1000",
  business_id: be_at_one.id
  )

tender2 = Tender.create!(
  description: "Tonic Water",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,6,21),
  volume: "2500",
  active: true,
  min_bid: "£750",
  business_id: ping_pong.id
  )

tender3 = Tender.create!(
  description: "Sake",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,9,21),
  volume: "500",
  active: true,
  min_bid: "£300",
  business_id: eat_tokyo.id
  )

tender4 = Tender.create!(
  description: "Tequila",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,11,21),
  volume: "900",
  active: true,
  min_bid: "£500",
  business_id: las_iguanas.id
  )

bid1 = Bid.create!(
  description: "Gordons",
  amount: 500,
  confirmed: false,
  incentives: "A single T-shirt",
  user_id: vendor1.id,
  tender_id: tender1.id,
)


puts "completed"
