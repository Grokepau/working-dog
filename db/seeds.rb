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
puts ''
puts '*** Note! password is "#{name}_secret ***"'
puts ''
puts 'Constructing Services'

sonic_id = User.find_by(username: "sonic").id
tails_id = User.find_by(username: "tails").id
big_id = User.find_by(username: "big").id
charmy_id = User.find_by(username: "charmy").id

new_services = [Service.new(title: "Rescue Animals", description: "Gotta go fast!", user_id:  sonic_id)]
new_services << Service.new(title: "Collect Rings", description: "Gotta be strong!", user_id:  sonic_id)
new_services << Service.new(title: "Sidekick for a Day", description: "I'll catch you when you fall down a pit - I promise!", user_id: tails_id)
new_services << Service.new(title: "Fishing", description: "Meoooooooooooow", user_id: charmy_id)
new_services << Service.new(title: "Produce Honey", description: "Been doing this for yearzzzz!", user_id: charmy_id)

puts 'Persisting Constructed Services...'
new_services.each do |service|
  p service
  service.save!
end
puts ' ** Done seeding services! Data for first and last service below...'
p Service.first
p Service.last

sidekick_id = Service.find_by(title: "Sidekick for a Day").id
honey_id = Service.find_by(title: "Produce Honey").id
fishing_id = Service.find_by(title: "Fishing").id

puts ' * Constructing sample bookings... * '

today = Date.today
tomorrow = Date.today + 1
day_after_tomorrow = Date.today + 2
Booking.create(user_id: sonic_id, service_id: sidekick_id, date: today)
Booking.create(user_id: sonic_id, service_id: sidekick_id, date: tomorrow)
Booking.create(user_id: sonic_id, service_id: honey_id, date: day_after_tomorrow)
Booking.create(user_id: big_id, service_id: sidekick_id, date: day_after_tomorrow)

puts " ***  Done with seeding! *** "





