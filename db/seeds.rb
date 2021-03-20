# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying seed files..."
User.destroy_all
puts "Destroyed!"


puts "Seeding Project"

puts "Creating bars..."
bar1 = User.create(email:"test1@test.com",password:"password",user_type: "bar")
bar2 = User.create(email:"test2@test.com",password:"password",user_type: "bar")
puts "Creating vendors..."
vendor1 = User.create(email:"test3@test.com",password:"password",user_type: "vendor")
vendor2 = User.create(email:"test4@test.com",password:"password",user_type: "vendor")

puts "completed"
