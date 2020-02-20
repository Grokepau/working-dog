# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Getting required helper libraries..."
require 'open-uri'

# puts 'Getting helper debug libraries'
# require 'pry'
# require 'pry-byebug'


puts "Cleaning Database..."

# should destory all bookings and everything else, via dependent: destroy
User.destroy_all
# Service.destroy_all
# Booking.destroy_all

puts 'Constructing new users...'

names_species = {'Lassie' => 'Dog',
                 'Flipper' => 'Dolphin',
                 'Secretariat' => 'Horse',
                 'Billy' => 'Goat',
                 'Brownie' => 'Dog',
                 'Big_Bird' => 'Bird',
                 'Willy' => 'Killer Whale'}

photo_urls = {'Lassie' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582138389/cartoon-border-rough-collie-sheltie-dog-breed-border-collie-icelandic-sheepdog-beauceron-scottish-terrier-png-clip-art_jlgdsr.png',
             'Flipper' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582178447/dolphin_PNG9132_pzimmn.png',
             'Secretariat' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582109474/secretariat_zztoiv.png',
             'Billy' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582109870/6-66555_transparent-goat-silhouette-png-goat-simulator-goat-png_pmko2a.png',
             'Brownie' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582109293/LeWagon_portraits_2020.02.06.-53_1_kljass.png',
             'Big_Bird' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582110224/111-1110639_big-bird-face-png-sesame-street-big-bird_iyellv.png',
             'Willy' => 'https://res.cloudinary.com/djutcyvwz/image/upload/v1582111168/killer_whale_PNG14_obabd7.png'}


locations = ["Ramat Gan",
             "Tel Aviv",
             "Jaffa",
             "Jersulem",
             "Herzilya"]

names_species.each do |name, species|
  puts "name = #{name}"
  puts "species = #{species}"
  new_user_details = {}
  new_user_details[:username] = name
  new_user_details[:species] = species
  new_user_details[:password] = "#{name}_secret"
  new_user_details[:location] = locations.sample
  new_user_details[:email] = "#{name}@#{name}.com"
  new_user_details[:admin] = false
  new_user = User.new(new_user_details)
  puts "new_user = #{new_user}"
  puts "photo_urls[name] =  #{photo_urls[name]}"

  file = URI.open(photo_urls[name])
  new_user.photo.attach(io: file, filename: "#{new_user[:username]}_avatar", content_type: 'image/png')
  new_user.save!
end

puts 'Done with normal users! Making an admin user -- data below...'
puts 'Data for first user below...'
p User.first

# p User.last
# puts ''
# puts '*** Note! password is "#{name}_secret ***"'
# puts ''
# puts 'Constructing Services'

# sonic_id = User.find_by(username: "sonic").id
# tails_id = User.find_by(username: "tails").id
# big_id = User.find_by(username: "big").id
# charmy_id = User.find_by(username: "charmy").id

# new_services = [Service.new(title: "Rescue Animals", description: "Gotta go fast!", user_id:  sonic_id)]
# new_services << Service.new(title: "Collect Rings", description: "Gotta be strong!", user_id:  sonic_id)
# new_services << Service.new(title: "Sidekick for a Day", description: "I'll catch you when you fall down a pit - I promise!", user_id: tails_id)
# new_services << Service.new(title: "Fishing", description: "Meoooooooooooow", user_id: charmy_id)
# new_services << Service.new(title: "Produce Honey", description: "Been doing this for yearzzzz!", user_id: charmy_id)

# puts 'Persisting Constructed Services...'
# new_services.each do |service|
#   p service
#   service.save!
# end
# puts ' ** Done seeding services! Data for first and last service below...'
# p Service.first
# p Service.last

# sidekick_id = Service.find_by(title: "Sidekick for a Day").id
# honey_id = Service.find_by(title: "Produce Honey").id
# fishing_id = Service.find_by(title: "Fishing").id

# puts ' * Constructing sample bookings... * '

# today = Date.today
# tomorrow = Date.today + 1
# day_after_tomorrow = Date.today + 2
# Booking.create(user_id: sonic_id, service_id: sidekick_id, date: today)
# Booking.create(user_id: sonic_id, service_id: sidekick_id, date: tomorrow)
# Booking.create(user_id: sonic_id, service_id: honey_id, date: day_after_tomorrow)
# Booking.create(user_id: big_id, service_id: sidekick_id, date: day_after_tomorrow)

# puts " ***  Done with seeding! *** "





