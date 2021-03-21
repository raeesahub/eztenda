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

CATEGORIES = %w(gin sake tequila tonic\ water white\ wine red\ wine spritzer whisky)

CATEGORIES.each do |category|
  Category.create!(description: category)
end

puts "Creating bars..."
bar1 = User.create!(email:"test1@test.com",password:"password",user_type: "bar", legal_name: "Stonegate Pub Company, 3 Monkspath Hall Road, Solihull, West Midlands B90 4SJ")
bar2 = User.create!(email:"test2@test.com",password:"password",user_type: "bar")
bar3 = User.create!(email:"test3@test.com",password:"password",user_type: "bar")
bar4 = User.create!(email:"test4@test.com",password:"password",user_type: "bar")
bar5 = User.create!(email:"test5@test.com",password:"password",user_type: "bar")
bar6 = User.create!(email:"test6@test.com",password:"password",user_type: "bar")
bar7 = User.create!(email:"test7@test.com",password:"password",user_type: "bar")
bar8 = User.create!(email:"test8@test.com",password:"password",user_type: "bar")
puts "Creating vendors..."
vendor1 = User.create!(email:"test9@test.com",password:"password",user_type: "vendor", legal_name: "Melius Drinks Ltd. (Pedrino")
vendor2 = User.create!(email:"test10@test.com",password:"password",user_type: "vendor")
vendor3 = User.create!(email:"test11@test.com",password:"password",user_type: "vendor")
vendor4 = User.create!(email:"test12@test.com",password:"password",user_type: "vendor")
vendor5 = User.create!(email:"test13@test.com",password:"password",user_type: "vendor")
vendor6 = User.create!(email:"test14@test.com",password:"password",user_type: "vendor")
vendor7 = User.create!(email:"test15@test.com",password:"password",user_type: "vendor")
vendor8 = User.create!(email:"test16@test.com",password:"password",user_type: "vendor")


puts "Creating businesses..."
be_at_one = Business.create!(name: "Be At One", description: "Cocktail bar", location: "London", number_of_venues: 15, user_id: bar1.id, image_url: "https://raw.githubusercontent.com/raeesahub/eztenda-files/master/beatone.png")
ping_pong = Business.create!(name: "Ping Pong", description: "Dim sum restaurant",
location: "London", number_of_venues: 5, user_id: bar2.id, image_url: "https://d3atsf3fgek2rw.cloudfront.net/content/uploads/2013/06/Unknown8.jpeg")

las_iguanas = Business.create!(name: "Las Iguanas", description: "Eat Latin, Drink Latin",location: "London", number_of_venues: 9, user_id: bar3.id, image_url: "https://www.regent-court.co.uk/wp-content/uploads/2018/01/las-iguanas.png
")

eat_tokyo = Business.create!(name: "Eat Tokyo", description: "Japanese restaurant", location: "London", number_of_venues: 2, user_id: bar4.id, image_url: "https://github.com/raeesahub/eztenda-files/blob/master/eattokyo.png?raw=true
")

slug_lettuce = Business.create!(name: "Slug & Lettuce", description: "Cocktail Bar", location: "London", number_of_venues: 8, user_id: bar5.id, image_url: "https://redcactusevents.b-cdn.net/wp-content/uploads/2018/12/the-slug-and-lettuce-logo.png
")

all_bar_one = Business.create!(name: "All Bar One", description: "Cocktail Bar", location: "London", number_of_venues: 16, user_id: bar5.id, image_url: "https://images.vouchercloud.com/image/upload/w_200,q_auto,fl_strip_profile,f_auto/all_bar_one_logo.jpg
")

dishoom = Business.create!(name: "Dishoom", description: "Bombay Cafe", location: "London", number_of_venues: 5, user_id: bar5.id, image_url: "https://www.thembsgroup.co.uk/wp-content/uploads/2020/05/Dishoom-logo-final.png
")

puts "Creating tenders..."
tender1 = Tender.create!(
  description: "Gin",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,3,21),
  volume: "1000",
  active: true,
  min_bid: "1000",
  business_id: be_at_one.id,
  categories_id: Category.find_by(description: "gin").id
)

tender2 = Tender.create!(
  description: "Tonic Water",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,6,21),
  volume: "2500",
  active: true,
  min_bid: "750",
  business_id: ping_pong.id,
  categories_id: Category.find_by(description: "tonic water").id
  )

tender3 = Tender.create!(
  description: "Sake",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,9,21),
  volume: "500",
  active: true,
  min_bid: "300",
  business_id: eat_tokyo.id,
  categories_id: Category.find_by(description: "sake").id
  )

tender4 = Tender.create!(
  description: "Tequila",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,11,21),
  volume: "900",
  active: true,
  min_bid: "500",
  business_id: las_iguanas.id,
  categories_id: Category.find_by(description: "tequila").id
  )

tender5 = Tender.create!(
  description: "Whisky",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,11,21),
  volume: "800",
  active: true,
  min_bid: "300",
  business_id: slug_lettuce.id,
  categories_id: Category.find_by(description: "whisky").id
  )

tender6 = Tender.create!(
  description: "Tonic Water",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,3,21),
  volume: "5000",
  active: true,
  min_bid: "1000",
  business_id: be_at_one.id,
  categories_id: Category.find_by(description: "tonic water").id
)

tender7 = Tender.create!(
  description: "White Wine",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,11,21),
  volume: "700",
  active: true,
  min_bid: "1000",
  business_id: be_at_one.id,
  categories_id: Category.find_by(description: "white wine").id
)

tender8 = Tender.create!(
  description: "Spritzer",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,9,21),
  volume: "6000",
  active: true,
  min_bid: "1000",
  business_id: be_at_one.id,
  categories_id: Category.find_by(description: "spritzer").id
)

tender9 = Tender.create!(
  description: "Red Wine",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,9,21),
  volume: "6000",
  active: true,
  min_bid: "1000",
  business_id: ping_pong.id,
  categories_id: Category.find_by(description: "red wine").id
)

tender10 = Tender.create!(
  description: "Spritzer",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,11,21),
  volume: "1000",
  active: true,
  min_bid: "300",
  business_id: slug_lettuce.id,
  categories_id: Category.find_by(description: "spritzer").id
  )

tender11 = Tender.create!(
  description: "Spritzer",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,12,21),
  volume: "7000",
  active: true,
  min_bid: "1000",
  business_id: all_bar_one.id,
  categories_id: Category.find_by(description: "spritzer").id
  )

tender12 = Tender.create!(
  description: "Whisky",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,6,21),
  volume: "4000",
  active: true,
  min_bid: "1000",
  business_id: dishoom.id,
  categories_id: Category.find_by(description: "whisky").id
  )

tender13 = Tender.create!(
  description: "White Wine",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2022,3,21),
  volume: "9000",
  active: true,
  min_bid: "1000",
  business_id: dishoom.id,
  categories_id: Category.find_by(description: "white wine").id
  )

tender12 = Tender.create!(
  description: "Red Wine",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,6,21),
  volume: "400",
  active: true,
  min_bid: "500",
  business_id: dishoom.id,
  categories_id: Category.find_by(description: "red wine").id
  )

bid1 = Bid.create!(
  description: "Gordons",
  amount: 500,
  incentives: "A single T-shirt",
  user_id: vendor1.id,
  tender_id: tender1.id,
)

bid2 = Bid.create!(
  description: "Tanquery",
  amount: 300,
  incentives: "200 glasses",
  user_id: vendor2.id,
  tender_id: tender1.id,
)

bid3 = Bid.create!(
  description: "The Botanist",
  amount: 600,
  incentives: "plus a further £600 if more than 1000 units sold",
  user_id: vendor1.id,
  tender_id: tender1.id,
)
bid4 = Bid.create!(
  description: "Hendrick's",
  amount: 700,
  incentives: "200 glasses",
  user_id: vendor1.id,
  tender_id: tender1.id,
)

bid5 = Bid.create!(
  description: "Bombay Sapphire",
  amount: 800,
  incentives: "plus a further £800 if more than 1000 units sold",
  user_id: vendor1.id,
  tender_id: tender1.id,
)

tender5 = Tender.create!(
  description: "Spritzer",
  start_date: Date.new(2021,3,21),
  end_date: Date.new(2021,11,21),
  volume: "800",
  active: true,
  min_bid: "300",
  business_id: slug_lettuce.id
  )

puts "creating_contract"

contract1 = Contract.create(
  tender: tender1,
  bid: bid4


)

puts "completed"
