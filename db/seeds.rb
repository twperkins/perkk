# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

if Rails.env.development?
  puts "Destroying reviews.."
  Review.destroy_all
  puts "Destroying perks..."
  Perk.destroy_all
  puts "Destroying users..."
  User.destroy_all
  puts "Destroying company..."
  Company.destroy_all
end

# created one company
puts "creating company.."
company = Company.create!(
  name: "Facebook",
  total_token: 20_000,
  head_count: 20,
  subscription_start: DateTime.parse("09/01/2009 17:00"),
  subscription_end: DateTime.parse("09/01/2010 19:00")
)
file = URI.open('https://source.unsplash.com/800x600/?company')
company.logo_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# demo user
puts "creating demo user.."
demo = User.create!(
  email: "demo@perk.com",
  password: "123456",
  name: "Chaplin",
  location: Faker::TvShows::BojackHorseman.character,
  unique_code: Faker::Barcode.ean,
  tokens: 1000,
  admin: true,
  company_id: company.id
)
file = URI.open('https://source.unsplash.com/800x600/?person')
demo.profile_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating 19 more users to match the company head count
puts "creating the rest of the users.."
19.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Internet.user,
    company_id: company.id,
    tokens: 1000
  )
  file = URI.open('https://source.unsplash.com/800x600/?person')
  user.profile_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new user"
end

puts "creating amazing perks.."
# creating perk 1
Perk.create!(
  name: "Five Free Friday Rides",
  description: "This perk offers you 5 free riders on 5 Fridays!",
  location: "United Kingdom",
  token_cost: 50,
  start_date: DateTime.parse("09/01/2009 17:00"),
  end_date: DateTime.parse("09/01/2010 19:00"),
  category: "travel",
  merchants: "Uber"
)
file = URI.open('https://source.unsplash.com/800x600/?uber')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 2
Perk.create!(
  name: "Bounce: the home of ping-pong",
  description: "Using this perk will allow you to have 10 free games in any bounce location in Lonon. ",
  location: "London",
  token_cost: 100,
  start_date: DateTime.parse("09/01/2009 17:00"),
  end_date: DateTime.parse("09/01/2010 19:00"),
  category: "social",
  merchants: "Bounce"
)
file = URI.open('https://source.unsplash.com/800x600/?bounce')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3
Perk.create!(
  name: "Wings",
  description: "This perk offers you 50% off on any Ryan flights booked on Thursdays.",
  location: "London",
  token_cost: 150,
  start_date: DateTime.parse("09/01/2009 17:00"),
  end_date: DateTime.parse("09/01/2010 19:00"),
  category: "travel",
  merchants: "Ryan Air"
)
file = URI.open('https://source.unsplash.com/800x600/?ryanair')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 4
Perk.create!(
  name: "City gardens",
  description: "Roam free and explore the wonderful gardens that London has to offer. This perk will allow you
  to get 10 entries in any gardens you decide to visit in London (*excludes Chelsea flower show and **only available
  between March and September.)",
  location: "London",
  token_cost: 200,
  start_date: DateTime.parse("09/03/2009 17:00"),
  end_date: DateTime.parse("09/09/2010 19:00"),
  category: "social",
  merchants: "London Council"
)
file = URI.open('https://source.unsplash.com/800x600/?garden')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 5
Perk.create!(
  name: "Pet Sitters",
  description: "Worried about your pet because too busy? Do you have an emergency? Pet Sitters offers 20 hours of free
  pet sitting. Once this hours have been used you can continue using the service with a 20% discount.",
  location: "United Kingdom",
  token_cost: 250,
  start_date: DateTime.parse("09/01/2009 17:00"),
  end_date: DateTime.parse("09/01/2010 19:00"),
  category: "pet",
  merchants: "Bark"
)
file = URI.open('https://source.unsplash.com/800x600/?pig')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')
