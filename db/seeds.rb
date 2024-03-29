require 'csv'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
filepath = "db/seeds/Assassins Wagon Seed.csv"

puts "Cleaning database..."
Booking.destroy_all
Assassin.destroy_all
User.destroy_all

puts "Creating Test User"

User.create(
  name: 'admin',
  email: 'admin@wagon.com',
  password: 'secret'
)

User.create(
  name: 'user',
  email: 'user@wagon.com',
  password: 'secret'
)

puts "Creating Assassins"

CSV.foreach(filepath, headers: :first_row) do |row|
  puts "Creating #{row['Name']}"

  user = User.create(
    name: row['Name'],
    email: "#{row['Name']}@wagon.com",
    password: 'secret'
  )

  assassin = Assassin.new(
    name: row['Name'],
    weapon: row['Weapon'],
    description: row['Description'],
    price: rand(0.0..50.0).round(2)
  )
  assassin.user = user
  assassin.photo.attach(io: File.open("app/assets/images/seed_profile_pic/#{row['Name']}.jpeg"),
                        filename: "#{row['Name']}.jpeg",
                        content_type: 'image/jpeg')
  assassin.save
end

puts "There are now #{Assassin.count} rows in the Assassin table"

puts "Creating bookings"

50.times do
  booking = Booking.new(
    target_name: Faker::JapaneseMedia::FmaBrotherhood.character,
    target_location: Faker::Address.full_address,
    deadline: Faker::Date.between_except(from: Date.today, to: 1.year.from_now, excepted: Date.today),
    details: Faker::TvShows::RickAndMorty.quote
  )
  booking.user = User.all.sample
  booking.assassin = Assassin.all.sample
  booking.save
end

50.times do
  booking = Booking.new(
    target_name: Faker::Movies::StarWars.character,
    target_location: Faker::Address.full_address,
    deadline: Faker::Date.between_except(from: Date.today, to: 1.year.from_now, excepted: Date.today),
    details: Faker::TvShows::GameOfThrones.quote
  )
  booking.user = User.all.sample
  booking.assassin = Assassin.all.sample
  booking.status = "Accepted"
  booking.save
end

50.times do
  booking = Booking.new(
    target_name: Faker::JapaneseMedia::SwordArtOnline.real_name,
    target_location: Faker::Address.full_address,
    deadline: Faker::Date.between_except(from: Date.today, to: 1.year.from_now, excepted: Date.today),
    details: Faker::TvShows::BigBangTheory.quote
  )
  booking.user = User.all.sample
  booking.assassin = Assassin.all.sample
  booking.status = "Completed"
  booking.save
end

puts "There are now #{Booking.count} rows in the Bookings table"

puts "Creating Reviews, There are #{Booking.select { |booking| booking.status == 'Completed' }.count} Completed Bookings"

Booking.select { |booking| booking.status == "Completed" }.each do |booking|
  booking.review = Faker::TvShows::Spongebob.quote
  booking.rating = rand(0..5)
  booking.save
end

puts "Created #{Booking.select { |booking| booking.review.present? }.count}"
puts "Finished!"
