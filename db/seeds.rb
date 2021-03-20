# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying seed files..."
Business.destroy_all
User.destroy_all
Tender.destroy_all
puts "Destroyed!"

puts "Seeding Project"

puts "Creating bars..."
bar1 = User.create!(email:"test1@test.com",password:"password",user_type: "bar")
bar2 = User.create!(email:"test2@test.com",password:"password",user_type: "bar")
puts "Creating vendors..."
vendor1 = User.create!(email:"test3@test.com",password:"password",user_type: "vendor")
vendor2 = User.create!(email:"test4@test.com",password:"password",user_type: "vendor")

puts "Creating businesses..."
Business.create!(name: "Be At One", description: "Cocktail bar", user_id: User.first.id, image_url: "https://raw.githubusercontent.com/raeesahub/eztenda-files/master/beatone.png")

puts "Creating tenders..."
tender1 = Tender.create!(
  description: "Gin",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,3,21),
  volume: "1000 bottles",
  active: true,
  business_id: Business.first.id
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
