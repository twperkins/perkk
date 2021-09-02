require "open-uri"

BOROUGH = %w[Hackney Southwark Lambeth Kensington Hammersmith Westminster Islington]

if Rails.env.development?
  puts "Destroying user perks.."
  UserPerk.destroy_all
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
  subscription_start: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  subscription_end: Faker::Date.between(from: '2014-09-23', to: '2014-09-25')
)
file = URI.open('https://source.unsplash.com/800x600/?company')
company.logo_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# demo user
puts "creating demo user.."
demo = User.create!(
  email: "demo@email.com",
  password: "123123",
  name: "Chaplin",
  location: Faker::TvShows::BojackHorseman.character,
  unique_code: "#{Faker::Verb.base}-#{Faker::Color.color_name}-#{Faker::Verb.past_participle}",
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
    tokens: 1000,
    location: BOROUGH.sample,
    unique_code: "#{Faker::Verb.base}-#{Faker::Color.color_name}-#{Faker::Verb.past_participle}"
  )
  file = URI.open('https://source.unsplash.com/800x600/?person')
  user.profile_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new user"
end

puts "creating amazing perks.."
# creating perk 1
perk = Perk.create!(
  name: "Five Free Friday Rides",
  description: "This perk offers you 5 free riders on 5 Fridays!",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "travel",
  merchants: "Uber"
)
file = URI.open('https://images.unsplash.com/photo-1551432615-469d73f41b97?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8dWJlcnx8fHx8fDE2MzA1MDkzNjk&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 1.5
perk = Perk.create!(
  name: "'Plus' membership",
  description: "50% off all orders, free delivery and exclusive discounts for a month!",
  location: BOROUGH.sample,
  token_cost: 150,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "membership",
  merchants: "Deliveroo"
)
file = URI.open('https://images.unsplash.com/photo-1610478920409-ec0f58e881a5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8ZGVsaXZlcm9vfHx8fHx8MTYzMDU4NDY2NQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 2
perk = Perk.create!(
  name: "Bounce: the home of ping-pong",
  description: "Using this perk will allow you to have 10 free games in any bounce location in London.",
  location: '241 Old St, London EC1V 9EY',
  token_cost: 100,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "Bounce"
)
file = URI.open('https://images.unsplash.com/photo-1616011869127-3508d3b14d48?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8dGFibGUtdGVubmlzfHx8fHx8MTYzMDUwOTM0OA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3
perk = Perk.create!(
  name: "Discounted flights",
  description: "This perk offers you 50% off on any Ryan flights booked on Thursdays.",
  location: 'London Heathrow Airport, Nelson Rd, Hounslow, England TW6 1NB, United Kingdom',
  token_cost: 150,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "travel",
  merchants: "Ryan Air"
)
file = URI.open('https://images.unsplash.com/photo-1583228370699-8406fb3f5771?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8cnlhbmFpcnx8fHx8fDE2MzA1MDkxNTc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3.5
perk = Perk.create!(
  name: "Railcard",
  description: "One year worth of a rail card membership.",
  location: 'Westminster',
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "travel",
  merchants: "National Rail"
)
file = URI.open('https://images.unsplash.com/photo-1607130376281-8b555a7f87dd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8dHJhaW58fHx8fHwxNjMwNTg0OTUx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3.7
perk = Perk.create!(
  name: "Cycle to work scheme",
  description: "50% off of a selection of bikes",
  location: 'Unit B Effra Rd, London SW2 1BZ',
  token_cost: 100,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "travel",
  merchants: "Halfords"
)
file = URI.open('https://images.unsplash.com/photo-1618762044398-ec1e7e048bbd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8YmljeWNsZXx8fHx8fDE2MzA1ODUxMjY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 4
perk = Perk.create!(
  name: "City gardens",
  description: "Roam free and explore the wonderful gardens that London has to offer. This perk will allow you
  to get 10 entries in any gardens you decide to visit in London (*excludes Chelsea flower show and **only available
  between March and September.)",
  location: 'Kew, Richmond, London, TW9 3AE',
  token_cost: 200,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "London Council"
)
file = URI.open('https://images.unsplash.com/photo-1621535884102-d13e00c76283?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8Z2FyZGVufHx8fHx8MTYzMDUxMzY4MA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 5
perk = Perk.create!(
  name: "Pet Sitters",
  description: "Worried about your pet because too busy? Do you have an emergency? Pet Sitters offers 20 hours of free
  pet sitting. Once this hours have been used you can continue using the service with a 20% discount.",
  location: BOROUGH.sample,
  token_cost: 250,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "pet",
  merchants: "Bark"
)
file = URI.open('https://images.unsplash.com/photo-1574220307753-957783ab948b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8cGlnfHx8fHx8MTYzMDUxMzYyOA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

puts "creating amazing perks.."
# creating perk 6
perk = Perk.create!(
  name: "Scuba-diving lessons",
  description: "London School of Diving is the capital's premier PADI dive school and the only London dive centre to be
   equipped with a purpose built heated scuba pool. Spend 6 weekends learning to scuba dive!",
  location: '11 Power Rd, Chiswick, London W4 5PT',
  token_cost: 250,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "course",
  merchants: "London School of Diving"
)
file = URI.open('https://images.unsplash.com/photo-1486685919142-89cc9fc91ef6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8c2N1YmEtZGl2aW5nfHx8fHx8MTYzMDUwOTMxOA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

puts "creating amazing perks.."
# creating perk 6
perk = Perk.create!(
  name: "Unicycle course",
  description: "2 free unicycle lessons, and then a 20% discount after if you wish to continue training!",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "course",
  merchants: "London School of Unicyclists"
)
file = URI.open('https://images.unsplash.com/photo-1486685919142-89cc9fc91ef6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8c2N1YmEtZGl2aW5nfHx8fHx8MTYzMDUwOTMxOA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 7
perk = Perk.create!(
  name: "Sushi-making course",
  description: "Learn to cook authentic Japanese food in Shoreditch, London. Beginners and advanced cooking classes with
   traditional and modern recipes with 2 free lessons.",
  location: '57 Columbia Rd, London E2 7RG',
  token_cost: 150,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "course",
  merchants: "Atsuko's kitchen"
)
file = URI.open('https://images.unsplash.com/photo-1534604973900-c43ab4c2e0ab?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8c3VzaGktY2hlZnx8fHx8fDE2MzA1MDkxMjM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 8
perk = Perk.create!(
  name: "Meal for Two",
  description: "This perk offers you 50% off at a Quirky, 18th-century townhouse tea room that transforms into a
   cocktail lounge every evening.",
  location: '9 Conduit St, London W1S 2XG',
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "Sketch London"
)
file = URI.open('https://images.unsplash.com/photo-1562685112-44cdeee971d5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8ZmluZS1kaW5pbmd8fHx8fHwxNjMwNTA5NTAz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 9
perk = Perk.create!(
  name: "Spa and Dine",
  description: "An oasis of calm, the extensively restored and enlarged Spa at Mandarin Oriental, London is a place to
   enjoy peace and serenity and to restore mind. Discover an exciting menu of next-generation treatments at The Spa at
   Mandarin Oriental, London.",
  location: '66 Knightsbridge, London SW1X 7LA',
  token_cost: 200,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "wellbeing",
  merchants: "The Spa at Mandarin Oriental"
)
file = URI.open('https://images.unsplash.com/photo-1488345979593-09db0f85545f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8c3BhfHx8fHx8MTYzMDUxMzUwMw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 9.5
perk = Perk.create!(
  name: "Luxury Spa for Two",
  description: "Modern glass and stone spa with thermal waters, Roman origins and an open rooftop swimming pool. Thermae
   Bath Spa, Britain' s only natural thermal spa, located in the historic city of Bath, offers traditional and
    state-of-the-art spa facilities.",
  location: 'The Hetling Pump Room, Hot Bath St, Bath BA1 1SJ',
  token_cost: 250,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "wellbeing",
  merchants: "The Lanesborough Club & Spa"
)
file = URI.open('https://images.unsplash.com/photo-1582490841511-81e1363fb48c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8amFjdXp6aXx8fHx8fDE2MzA1ODM4NjQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 10
perk = Perk.create!(
  name: "London waterbus",
  description: "Enjoy a leisurely a one-way guided boat trip down Regent's Canal between Little Venice and Camden Town
   in either direction, passing by the London Zoo.",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "London waterbus"
)
file = URI.open('https://images.unsplash.com/photo-1570701583670-d18d3d6f5d4b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8bG9uZG9uLWNhbmFsLWJvYXR8fHx8fHwxNjMwNTEwMTU2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 11
perk = Perk.create!(
  name: "Jacuzzi boats",
  description: "The home of floating Hot Tubs & BBQ boats in London. Each hot tub boat holds seven suave punters, and
   the tubs are heated to a balmy 38 degrees.",
  location: BOROUGH.sample,
  token_cost: 150,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "Skuna Boats"
)
file = URI.open('https://images.unsplash.com/photo-1528725106046-533c9bbccd81?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8amFjdXp6aXx8fHx8fDE2MzA1ODM5ODc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

puts "creating amazing perks.."
# creating perk 12
perk = Perk.create!(
  name: "Bonsai sculpting course",
  description: "Learn about setting the main branch structure of a tree, creating ramification, carving, deciduous apex
   design, yamadori collection and wiring!",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "course",
  merchants: "Bonsai empire"
)
file = URI.open('https://images.unsplash.com/photo-1624162872504-e57ceca8874f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8Ym9uc2FpfHx8fHx8MTYzMDUxNDE1Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 13
perk = Perk.create!(
  name: "Go-karting",
  description: "London & UK's longest indoor go karting track at 1050m. 270cc and 160cc go karts.",
  location: '20 Allied Way, London W3 0RQ',
  token_cost: 100,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "TeamSport Go Karting"
)
file = URI.open('https://images.unsplash.com/photo-1522211041032-a7eb9a3f8c0f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8Z28ta2FydGluZ3x8fHx8fDE2MzA1MTQ2NjQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 14
perk = Perk.create!(
  name: "Online escape rooms",
  description: "Beat the clock across 4 fiendishly tricky escape room. With up to 8 players you can work together to
   solve a series of puzzles. Play online from multiple devices and locations",
  location: 'London',
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "Mansion impossible"
)
file = URI.open('https://images.unsplash.com/photo-1622831423205-4b2d8cfb2cfc?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8bXlzdGVyeXx8fHx8fDE2MzA1MTQ4NDI&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 15
perk = Perk.create!(
  name: "Virtual wellbeing sessions",
  description: "Embark on a journey to a happier, healthier you with one year’s subscription to Whitecalm’s online 360°
   all round wellbeing sessions.",
  location: 'London',
  token_cost: 100,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "wellbeing",
  merchants: "Well Bean"
)
file = URI.open('https://images.unsplash.com/photo-1586439496903-c96e9f18f212?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=600&ixid=MnwxfDB8MXxyYW5kb218MHx8eW9nYXx8fHx8fDE2MzA1MTQ5ODQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 16
perk = Perk.create!(
  name: "Arts membership",
  description: "Free entry to Turner, Rego, and Kusama. Enjoy exclusive Members Hours, incredible shows, discounts and
  more. Free entry for Members. Join Tate Members today.",
  location: 'Bankside, London SE1 9TG',
  token_cost: 150,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "membership",
  merchants: "TATE"
)
file = URI.open('https://source.unsplash.com/800x600/?art')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# reviews user
rand(2..7).times do
  puts "creating reviews.."
  Review.create!(
    comment: Faker::Restaurant.review,
    rating: rand(0..5),
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id
  )
end
