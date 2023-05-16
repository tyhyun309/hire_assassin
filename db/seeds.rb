require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."

Assassin.destroy_all

# user = User.create(
#   name: 'lewagon',
#   email: 'le@wagon.com',
#   password: 'secret'
# )

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

CSV.foreach(Rails.root.join('db/seeds/assassins.csv'), headers: true) do |row|
  Assassin.create({

    name: row['name'],
    weapon: row['weapon'],
    description: row['description'],
    price: row['price'].to_i,
    user_id: row['user_id'].to_i,
    photo: row['photo']
  })
end

puts "There are now #{Assassin.count} rows in the transactions table"

puts "Finished!"
