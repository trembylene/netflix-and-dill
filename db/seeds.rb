# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database"
Booking.destroy_all
Plant.destroy_all

puts "Creating fake plants..."

plant = Plant.new(
  title: Faker::Book.title,
  description: "The tears of this plant cure cancer. Too bad it has never cried. Ever.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022253/nagy-arnold-586722-unsplash.jpg"),
  care: "It lives off sorrow",
  user_id: 1,
  cost: 200,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "122 Albert St, Port Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "This plant does not sleep. It waits.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022248/tony-lam-hoang-199782-unsplash.jpg"),
  care: "Let it sit in a corner, it will be okay.",
  user_id: 1,
  cost: 10,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "99 Beacon Rd, Port Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "My plant is ten feet tall, weighs two-tons, breathes fire, and could eat a hammer and take a shotgun blast standing.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022249/stephanie-studer-507123-unsplash.jpg"),
  care: "Try and kill it. Just try...",
  user_id: 1,
  cost: 95,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "128 Farrell St, Port Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "This plant will attain statehood in 2009. Its state flower will be the Magnolia.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022255/vincent-foret-508876-unsplash.jpg"),
  care: "It has a big ego that needs to be fed, fertilize well.",
  user_id: 1,
  cost: 5,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "396 Clarendon St, South Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "The Great Wall of China was originally created to keep this plant out. It failed miserably.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022256/manja-benic-558171-unsplash.jpg"),
  care: "Just don't pour orange juice on it.",
  user_id: 1,
  cost: 17,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "177 Cecil St, South Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "There is no theory of evolution, just a list of creatures this plant allows to live.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022258/kari-shea-119756-unsplash.jpg"),
  care: "This plant is cannabalistic, so keep it away from other plants unless you don't like them.",
  user_id: 1,
  cost: 12,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "248 Esplanade East, Port Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "My plant was in the opening scene of the movie 'Saving Private Ryan'",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022258/scott-webb-104380-unsplash.jpg"),
  care: "Water daily, but apart from that it can take care of itself.",
  user_id: 1,
  cost: 160,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "117 Farrell St, Port Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "Looking for a plant that will never leave you or let you have any alone time and will question everything in your life? This is it.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022259/tran-mau-tri-tam-50886-unsplash.jpg"),
  care: "The quickest way to this plants heart is some TLC. Or any attention really.",
  user_id: 1,
  cost: 20,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "16 Morris St, South Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "This plant can drink an entire gallon of milk in forty-seven seconds.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022259/sweet-ice-cream-photography-95120-unsplash.jpg"),
  care: "It pretty much lives in liquid, so water well",
  user_id: 1,
  cost: 22,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "90 Collins St, Melbourne",
  )
plant.save!

plant = Plant.new(
  title: Faker::Book.title,
  description: "In an average living room there are 1,242 objects that could kill you. This plant is one of them.",
  photo: open("https://res.cloudinary.com/trembylene/image/upload/v1524022263/chris-barbalis-386248-unsplash.jpg"),
  care: "Feed fertilizer through a syringe and wearing gloves. You don't want to touch this plant...",
  user_id: 1,
  cost: 350,
  plant_type: ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"].sample,
  address: "151 Beach St, Port Melbourne",
  )
plant.save!

puts "Finished! You now have plants!"
