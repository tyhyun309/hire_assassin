# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."

Assassin.destroy_all
User.destroy_all

user = User.create(
  name: 'lewagon',
  email: 'le@wagon.com',
  password: 'secret'
)

puts "Creating assassins..."
Assassin.create(
  user_id: user.id,
  name: "Joyce",
  weapon: "Surfboard",
  description: 'love surfing with killing',
  price: 0.8,

)

Assassin.create(
  user_id: user.id,
  name: "Arthur",
  weapon: "Bare Fist",
  description: 'love the gym',
  price: 0.8,

)

Booking.create(
  assassin_id: 1,
  user_id: 2,
  details: "I want Assassin Joyce to eliminate Lucas Reynolds, a corrupt real estate tycoon who frequently attends high-profile surfing competitions in Malibu. Joyce will use her surfboard dagger to discreetly strike during one of these competitions. Lets ensure justice prevails and put an end to Lucass harmful actions.",
  target_name: "LUCAS REYNOLDS",
  target_location: "MALIBU, CALIFORNIA, USA",
  deadline: "must be completed by July 15, 2023."
)

Booking.create(
  assassin_id: 1,
  user_id: 2,
  details: "he massacre took place in El Paso. Bud is leading his brother to believe that he was so vehemently opposed to the attempt on Beatrix.",
  target_name: "Budd",
  target_location: "NY, USA",
  deadline: "must be completed by Dec 18, 2024."
)

puts "Finished!"
