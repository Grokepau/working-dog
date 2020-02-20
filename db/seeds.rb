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
Service.destroy_all
Booking.destroy_all

puts 'Constructing new users...'

sonic_team = {'Lassie' => 'Dog',
              'Flipper' => 'Dolphin',
              'Secretariat' => 'Horse',
              'Billy' => 'Goat',
              'Brownie' => 'Dog',
              'Big Bird' => 'Bird',
              'Willy' => 'Killer Whale'}

photo_urls = {'Lassie' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582054739/mAetHQaMfgCEXfLbRNGBqN6p.png',
             'Flipper' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582055384/kAgd2Ew9SscPhYeFAgeTy62W.png',
             'Secretariat' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582109474/secretariat_zztoiv.png',
             'Billy' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582109870/6-66555_transparent-goat-silhouette-png-goat-simulator-goat-png_pmko2a.png',
             'Brownie' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582109293/LeWagon_portraits_2020.02.06.-53_1_kljass.png',
             'Big Bird' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582110224/111-1110639_big-bird-face-png-sesame-street-big-bird_iyellv.png',
             'Willy' => 'Killer Whale'}


locations = ["Ramat Gan",
             "Tel Aviv",
             "Jaffa",
             "Jersulem",
             "Herzilya"]

sonic_team.each do |name, species|
  new_user_details = {}
  new_user_details[:username] = name
  new_user_details[:species] = species
  new_user_details[:password] = "#{name}_secret"
  new_user_details[:location] = locations.sample
  new_user_details[:email] = "#{name}@#{name}.com"
  new_user_details[:admin] = false
  User.create!(new_user_details)
end

puts 'Done with normal users! Making an admin user -- data below...'
puts 'Data for first user below...'
p User.first
User.create!( username: 'bossman',
              species: 'human',
              password: 'bossman_secret',
              location: 'Israel',
              email: 'bossman@human.com',
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





