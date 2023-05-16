require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
filepath = "db/seeds/Assassins Wagon Seed.csv"

puts "Cleaning database..."
Assassin.destroy_all
User.destroy_all


puts "Creating Test User"

admin = User.create(
  name: 'lewagon',
  email: 'le@wagon.com',
  password: 'secret'
)

user = User.create(
  name: 'user',
  email: 'user@wagon.com',
  password: 'secret'
)
# puts "Creating assassins..."
# Assassin.create(
#   user_id: user.id,
#   name: "Joyce",
#   weapon: "Surfboard",
#   description: 'love surfing with killing',
#   price: 0.8,

# )

# Assassin.create(
#   user_id: user.id,
#   name: "Arthur",
#   weapon: "Bare Fist",
#   description: 'love the gym',
#   price: 0.8,

# )
puts "Creating Assassins"

CSV.foreach(filepath, headers: :first_row) do |row|
  puts "Creating #{row['Name']}"
  assassin = Assassin.new(
    name: row['Name'],
    weapon: row['Weapon'],
    description: row['Description'],
    price: row['Price'].to_f,
    photo: row['Photo']
  )
  assassin.user = user
  assassin.photo.attach(io: File.open("app/assets/images/seed_profile_pic/#{row['Name']}.jpeg"),
                        filename: "#{row['Name']}.jpeg",
                        content_type: 'image/jpeg')
  assassin.save
end

puts "There are now #{Assassin.count} rows in the Assassin table"

puts "Finished!"
