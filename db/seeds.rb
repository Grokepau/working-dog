# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning Database"

# should destory all bookings and everything else, via dependent: destroy
User.destroy_all

puts "Constructing new users..."

sonic_team = {"sonic" => "hedgehog",
              "tails" => "fox",
              "big" => "cat",
              "charmy" => "bee",
              "vector" => "alligator",
              "rouge" => "bat",
              "cream" => "rabbit"}


sonic_team.each do |name, species|
  new_user_details = {}
  new_user_details[:username] = name
  new_user_details[:species] = species
  new_user_details[:password] = "#{name}_secret"
  new_user_details[:location] = "#{name} zone"
  new_user_details[:email] = "#{name}@#{species}.com"
  new_user_details[:admin] = false
  User.create!(new_user_details)
end

puts 'Done with normal users! Making an admin user -- data below...'
puts 'Data for first user below...'
p User.first
User.create!( username: 'eggman',
              species: 'human',
              password: 'eggman_secret',
              location: 'eggman zone',
              email: 'eggman@human.com',
              admin: 'true')
puts 'Data for last user (admin) below...'
p User.last
puts '*** Note! password is "#{name}_secret ***"'



