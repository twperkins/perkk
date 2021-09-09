require "open-uri"

BOROUGH = %w[Hackney Southwark Lambeth Kensington Hammersmith Westminster Islington]

if Rails.env.development?
  puts "Destroying user perks.."
  UserPerk.destroy_all
  puts "Destroying orders.."
  Order.destroy_all
  puts "Destroying tokens.."
  Token.destroy_all
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
  subscription_start: Faker::Date.between(from: 2.days.ago, to: Date.today),
  subscription_end: Faker::Date.forward(days: 365)
)
file = URI.open('https://source.unsplash.com/800x600/?company')
company.logo_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# demo user
puts "creating demo user.."
demo = User.create!(
  email: "charlie@facebook.com",
  password: "123123",
  name: "Chaplin",
  location: Faker::TvShows::BojackHorseman.character,
  unique_code: "#{Faker::Verb.base}-#{Faker::Color.color_name}-#{Faker::Verb.past_participle}",
  token_allowance: 1000,
  tokens_used: 0,
  admin: true,
  qr_code: "http://www.perkk.co.uk/",
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
    name: Faker::Name.first_name,
    company_id: company.id,
    token_allowance: 1000,
    tokens_used: 0,
    location: BOROUGH.sample,
    unique_code: "#{Faker::Verb.base}-#{Faker::Color.color_name}-#{Faker::Verb.past_participle}",
    qr_code: "http://www.perkk.co.uk/"
  )
  file = URI.open('https://source.unsplash.com/800x600/?person')
  user.profile_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new user"
end

puts "creating amazing perks.."
# creating perk 1
perk = Perk.create!(
  name: "Free Friday Rides",
  description: "Can't wait to get home? Get free rides within London on Fridays!",
  location: BOROUGH.sample,
  token_cost: 170,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Uber"
)
file = URI.open('https://images.unsplash.com/photo-1482029255085-35a4a48b7084?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dWJlcnx8fHx8fDE2MzA2NjczNjc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 1.2
perk = Perk.create!(
  name: "One month of 50% off",
  description: "Can't wait to get home? Get 50% off of ubers for a month! Get a ride in minutes. Uber is finding you
   better ways to move, work, and succeed in the United Kingdom.",
  location: BOROUGH.sample,
  token_cost: 110,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Uber"
)
file = URI.open('https://images.unsplash.com/photo-1625959518941-99decaa7d878?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dWJlcnx8fHx8fDE2MzExODA0NTU&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 1.3
perk = Perk.create!(
  name: "A year of free delivery",
  description: "Find the best restaurants that deliver. Get contactless delivery for restaurant takeaways, food shopping
   and more! Order food online or in the Uber Eats app and get free delivery cost every time!",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "Uber Eats"
)
file = URI.open('https://images.unsplash.com/photo-1604167504016-6d7b03ab184f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dGFrZWF3YXl8fHx8fHwxNjMxMTgwNDI5&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 1.3
perk = Perk.create!(
  name: "Half price Japanese cuisine",
  description: "Find the best Japanese restaurants that deliver. Get contactless delivery for restaurant takeaways, food
   shopping and more! Order food online or in the Uber Eats app and get 50% off Japanese cuisine for two months!",
  location: BOROUGH.sample,
  token_cost: 70,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "Uber Eats"
)
file = URI.open('https://images.unsplash.com/photo-1581331474665-a0bbee7dfba9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8amFwYW5lc2UtZm9vZHx8fHx8fDE2MzExODAzOTc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 1.5
perk = Perk.create!(
  name: "Two months membership",
  description: "50% off all orders, free delivery and exclusive discounts for two months!",
  location: BOROUGH.sample,
  token_cost: 170,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "Deliveroo"
)
file = URI.open('https://images.unsplash.com/photo-1610478920409-ec0f58e881a5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8ZGVsaXZlcm9vfHx8fHx8MTYzMDY2NzE0Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 2
perk = Perk.create!(
  name: "10 games of ping-pong",
  description: "Wind down with 10 free games in any Bounce location in London.",
  location: '241 Old St, London EC1V 9EY',
  token_cost: 100,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Bounce"
)
file = URI.open('https://images.unsplash.com/photo-1519162952575-c6c7199502a3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cGluZy1wb25nfHx8fHx8MTYzMDY2NzEyMA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 2
perk = Perk.create!(
  name: "Group ping-pong and beers",
  description: "Wind down with an evening of beers and ping-pong in any Bounce location in London.",
  location: '241 Old St, London EC1V 9EY',
  token_cost: 40,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Bounce"
)
file = URI.open('https://images.unsplash.com/photo-1461748659110-16121c049d52?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cGluZy1wb25nfHx8fHx8MTYzMTE4MDI5Ng&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3
perk = Perk.create!(
  name: "4x Flights",
  description: "Save on your next holiday with 4 seats on any Ryanair flights to Europe.",
  location: 'London Heathrow Airport, Nelson Rd, Hounslow, England TW6 1NB, United Kingdom',
  token_cost: 220,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Ryanair"
)
file = URI.open('https://images.unsplash.com/photo-1493235818145-77224bfd6e5c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cGxhbmV8fHx8fHwxNjMwNjY3MDcz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3
perk = Perk.create!(
  name: "50% off on flights for two",
  description: "Save on your next holiday with 50% off of any Ryanair flights to Europe. Only redeemable once!",
  location: 'London Heathrow Airport, Nelson Rd, Hounslow, England TW6 1NB, United Kingdom',
  token_cost: 70,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Ryanair"
)
file = URI.open('https://images.unsplash.com/photo-1558438542-983bb555e8da?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8aGVhdGhyb3ctYWlycG9ydHx8fHx8fDE2MzExODAyNTY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3.5
perk = Perk.create!(
  name: "Railcard",
  description: "One year worth of a rail card membership.",
  location: 'Westminster',
  token_cost: 90,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "National Rail"
)
file = URI.open('https://images.unsplash.com/photo-1542823827-b6172875c7e9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dHJhaW58fHx8fHwxNjMwNjY3MDEz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 3.7
perk = Perk.create!(
  name: "Cycle to work scheme",
  description: "50% off of a selection of bikes",
  location: 'Unit B Effra Rd, London SW2 1BZ',
  token_cost: 70,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Halfords"
)
file = URI.open('https://images.unsplash.com/photo-1560828981-b0cd6639bff6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8YmljeWNsZXx8fHx8fDE2MzA2NjY5NTM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 4
perk = Perk.create!(
  name: "City gardens",
  description: "Roam free and explore the wonderful gardens that London has to offer. This perk will allow you
  to get 10 entries in any gardens you decide to visit in London (*excludes Chelsea flower show **only available
  between March and September.)",
  location: 'Kew, Richmond, London, TW9 3AE',
  token_cost: 140,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "London Council"
)
file = URI.open('https://images.unsplash.com/photo-1605216406421-e54eba840e98?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8a2V3LWdhcmRlbnN8fHx8fHwxNjMwNjY2OTIw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 5
perk = Perk.create!(
  name: "Pet Sitters",
  description: "Worried about your pet when you're at work? Do you have an emergency? Pet Sitters offers 20 hours of free
  pet sitting. Once these hours have been used you can continue using the service with a 20% discount.",
  location: BOROUGH.sample,
  token_cost: 130,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "pet",
  merchants: "Bark"
)
file = URI.open('https://images.unsplash.com/photo-1453227588063-bb302b62f50b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cGV0LXNpdHRlcnx8fHx8fDE2MzExODAxNDE&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 5
perk = Perk.create!(
  name: "Pet insurance",
  description: "Petplan is the UK's leading pet insurer with 40 years' experience helping pets through illness and
   injury. Get a quote today and receive 50% off!",
  location: BOROUGH.sample,
  token_cost: 80,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "pet",
  merchants: "Petplan"
)
file = URI.open('https://images.unsplash.com/photo-1549291981-56d443d5e2a2?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cGV0fHx8fHx8MTYzMTE4MDEwNw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

puts "creating amazing perks.."
# creating perk 6
perk = Perk.create!(
  name: "Scuba-diving lessons",
  description: "London School of Diving is the capital's premier PADI dive school and the only London dive centre to be
   equipped with a purpose built heated scuba pool. Spend 6 weekends learning to scuba dive!",
  location: '11 Power Rd, Chiswick, London W4 5PT',
  token_cost: 270,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "London School of Diving"
)
file = URI.open('https://images.unsplash.com/photo-1613046462996-4c586c685925?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c2N1YmEtZGl2aW5nfHx8fHx8MTYzMDY2Njg2NA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

puts "creating amazing perks.."
# creating perk 6
perk = Perk.create!(
  name: "Unicycle course",
  description: "2 free unicycle lessons, and then a 20% discount after if you wish to continue training!",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "London School of Unicyclists"
)
file = URI.open('https://images.unsplash.com/photo-1517208268027-690eee3d356f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dW5pY3ljbGV8fHx8fHwxNjMwNjY2NjUy&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 7
perk = Perk.create!(
  name: "Sushi-making course",
  description: "Learn to cook authentic Japanese food in Shoreditch, London. Beginners and advanced cooking courses with
   traditional and modern recipes over 4 lessons.",
  location: '57 Columbia Rd, London E2 7RG',
  token_cost: 80,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "Atsuko's kitchen"
)
file = URI.open('https://images.unsplash.com/photo-1584671986324-fc1ce89a5b07?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c3VzaGl8fHx8fHwxNjMwNjY3NDE0&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 8
perk = Perk.create!(
  name: "Meal for Two",
  description: "This perk offers you 50% off at a Quirky, 18th-century townhouse tea room that transforms into a
   cocktail lounge every evening.",
  location: '9 Conduit St, London W1S 2XG',
  token_cost: 20,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Sketch London"
)
file = URI.open('https://images.unsplash.com/photo-1574966739987-65e38db0f7ce?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8ZGluaW5nfHx8fHx8MTYzMDY2NzUzNw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 9
perk = Perk.create!(
  name: "Spa and Dine",
  description: "An oasis of calm, the extensively restored and enlarged Spa at Mandarin Oriental, London is a place to
   enjoy peace and serenity and to restore mind. Discover an exciting menu of next-generation treatments at The Spa at
   Mandarin Oriental, London.",
  location: '66 Knightsbridge, London SW1X 7LA',
  token_cost: 220,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "wellbeing",
  merchants: "The Spa at Mandarin Oriental"
)
file = URI.open('https://images.unsplash.com/photo-1583417267826-aebc4d1542e1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c3BhfHx8fHx8MTYzMDY2NzU2Ng&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 9.5
perk = Perk.create!(
  name: "Luxury Spa for Two",
  description: "Modern glass and stone spa with thermal waters, Roman origins and an open rooftop swimming pool. Thermae
   Bath Spa, Britain' s only natural thermal spa, located in the historic city of Bath, offers traditional and
    state-of-the-art spa facilities.",
  location: 'The Hetling Pump Room, Hot Bath St, Bath BA1 1SJ',
  token_cost: 280,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "wellbeing",
  merchants: "The Lanesborough Club & Spa"
)
file = URI.open('https://images.unsplash.com/photo-1591343395082-e120087004b4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c3BhfHx8fHx8MTYzMDY2NzY1Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 10
perk = Perk.create!(
  name: "Regent's Canal trip",
  description: "Enjoy a leisurely a one-way guided boat trip down Regent's Canal between Little Venice and Camden Town
   in either direction, passing by the London Zoo.",
  location: BOROUGH.sample,
  token_cost: 30,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "London waterbus"
)
file = URI.open('https://images.unsplash.com/photo-1559564484-948476f9e72a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FuYWwtYm9hdHx8fHx8fDE2MzA2Njc4NDM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 11
perk = Perk.create!(
  name: "Jacuzzi boats",
  description: "The home of floating Hot Tubs & BBQ boats in London. Each hot tub boat holds seven suave punters, and
   the tubs are heated to a balmy 38 degrees.",
  location: BOROUGH.sample,
  token_cost: 160,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Skuna Boats"
)
file = URI.open('https://images.unsplash.com/photo-1600976712065-e1cf442bb387?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8amFjdXp6aXx8fHx8fDE2MzA2NjgwNjM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

puts "creating amazing perks.."
# creating perk 12
perk = Perk.create!(
  name: "Bonsai sculpting course",
  description: "Learn about setting the main branch structure of a tree, creating ramification, carving, deciduous apex
   design, yamadori collection and wiring!",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "Bonsai empire"
)
file = URI.open('https://images.unsplash.com/photo-1611387729672-25583e070328?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Ym9uc2FpfHx8fHx8MTYzMTE4MDA3Ng&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 13
perk = Perk.create!(
  name: "Go-karting for one",
  description: "London & UK's longest indoor go karting track at 1050m. 270cc and 160cc go karts. Book an evening for
  yourself, and race others!",
  location: '20 Allied Way, London W3 0RQ',
  token_cost: 20,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "TeamSport Go Karting"
)
file = URI.open('https://images.unsplash.com/photo-1555349260-32bfc31e538d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Z28ta2FydHx8fHx8fDE2MzExODAwNDk&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 13
perk = Perk.create!(
  name: "Group go-karting",
  description: "London & UK's longest indoor go karting track at 1050m. 270cc and 160cc go karts. Book an evening for
  yourself and 9 friends!",
  location: '20 Allied Way, London W3 0RQ',
  token_cost: 100,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "TeamSport Go Karting"
)
file = URI.open('https://images.unsplash.com/photo-1555349224-bdbeaaf0096a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Z28ta2FydHx8fHx8fDE2MzExODAwMzE&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 14
perk = Perk.create!(
  name: "Online escape room",
  description: "Beat the clock across 4 fiendishly tricky escape room. With up to 8 players you can work together to
   solve a series of puzzles. Play online from multiple devices and locations.",
  location: 'London',
  token_cost: 40,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Mansion impossible"
)
file = URI.open('https://images.unsplash.com/photo-1554493752-e4543263886c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8bXlzdGVyeXx8fHx8fDE2MzExODAwMTQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 14
perk = Perk.create!(
  name: "Haunted mansion escape room",
  description: "Beat the clock across 4 fiendishly tricky escape room. You can work together to solve a series of
   puzzles at our haunted mansion located in Hoxten! Bring up to 7 of your friends and try your best to escape as quick
   as you can.",
  location: 'London',
  token_cost: 70,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Mansion impossible"
)
file = URI.open('https://images.unsplash.com/photo-1604255981616-880f65c7a119?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8aGF1bnRlZC1tYW5zaW9ufHx8fHx8MTYzMTE3OTk5NA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 15
perk = Perk.create!(
  name: "Virtual wellbeing sessions",
  description: "Embark on a journey to a happier, healthier you with one year’s subscription to Whitecalm’s online 360°
   all round wellbeing sessions.",
  location: 'London',
  token_cost: 60,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "wellbeing",
  merchants: "Well Bean"
)
file = URI.open('https://images.unsplash.com/photo-1609751352001-25b60439239c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c2t5cGV8fHx8fHwxNjMxMTc5OTcz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 16
perk = Perk.create!(
  name: "Arts membership",
  description: "Free entry to Turner, Rego, and Kusama. Enjoy exclusive Members Hours, incredible shows, discounts and
  more. Free entry for Members. Join Tate Members today.",
  location: 'Bankside, London SE1 9TG',
  token_cost: 150,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "TATE"
)
file = URI.open('https://images.unsplash.com/photo-1608572257175-021825e20081?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8a3VzYW1hfHx8fHx8MTYzMTE3OTg5OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 16
perk = Perk.create!(
  name: "London Arts tours",
  description: "A day of custom arts tours, centerted on a variety of specific arts movements in history, starting at
   the Tate Modern and exploring multiple galleries and museums to create a well rounded investigation on the
   arts movement of your choice! Upcoming tours: impressionism, abstract expressionism, romanticism and more.",
  location: 'Bankside, London SE1 9TG',
  token_cost: 60,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "TATE"
)
file = URI.open('https://images.unsplash.com/photo-1575223970966-76ae61ee7838?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2xhc3NpYy1hcnR8fHx8fHwxNjMwOTI3MTk3&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 17
perk = Perk.create!(
  name: "Museum membership",
  description: "Enjoy exclusive Members Hours, incredible shows, discounts, all-access to all archives, and more. Free
   entry for Members. Join us at the National Gallery today.",
  location: 'Trafalgar Square, London WC2N 5DN',
  token_cost: 90,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "National Gallery"
)
file = URI.open('https://images.unsplash.com/photo-1585950483336-8d59d18e0ffe?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Z2FsbGVyeXx8fHx8fDE2MzExNzk4NTg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 17
perk = Perk.create!(
  name: "Museum membership",
  description: "Enjoy exclusive Members Hours, incredible shows, discounts, all-access to all archives, and more. Free
   entry for Members. Join us at the Victoria and Albert Museum today.",
  location: 'Cromwell Rd, London SW7 2RL',
  token_cost: 100,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "V&A Museum"
)
file = URI.open('https://images.unsplash.com/photo-1561328688-f84502cf2c3e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dixhLW11c2V1bXx8fHx8fDE2MzExNzk4Mzc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 16
perk = Perk.create!(
  name: "10 week Web Dev bootcamp",
  description: "Learn HTML, CSS, JS and More! Save Your Seat. Sign Up Today. Award-Winning Curriculum. Join Our Tech
   Community. Learn Now & Pay Later. Learn Cutting Edge Skills. Financing Opportunities. Part-Time and Full-Time. Learn
   On Campus & Online.",
  location: 'Shoreditch Stables, North, 138 Kingsland Rd, London E2 8DY',
  token_cost: 400,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "Le Wagon"
)
file = URI.open('https://images.unsplash.com/photo-1557853197-aefb550b6fdc?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y29kaW5nfHx8fHx8MTYzMTE3OTYzMw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 17
perk = Perk.create!(
  name: "Orange Wednesdays",
  description: "Two cinema tickets for the price of one on any Wednesday.",
  location: BOROUGH.sample,
  token_cost: 10,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Orange Network"
)
file = URI.open('https://images.unsplash.com/photo-1608170825938-a8ea0305d46c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2luZW1hfHx8fHx8MTYzMTE3OTI5Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 17
perk = Perk.create!(
  name: "Family outdoor cinema tickets",
  description: "Free family of five outdoor cinema tickets at Waddesdon Cinema. Watch a selection of classic films in
   the striking setting of Waddesdon Manor. Explore an extensive art collection and impressive Victorian gardens.
   Redeemable once a month. Events all year.",
  location: BOROUGH.sample,
  token_cost: 60,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Waddesdon Cinema"
)
file = URI.open('https://images.unsplash.com/photo-1527979809431-ea3d5c0c01c9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2luZW1hfHx8fHx8MTYzMTE3OTMyOA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 17
perk = Perk.create!(
  name: "Indie film Thursday",
  description: "Two cinema tickets on any Thursday at any Everyman cinema, every month for a year!",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "social",
  merchants: "Everyman cinema"
)
file = URI.open('https://images.unsplash.com/photo-1559570278-eb8d71d06403?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2luZW1hfHx8fHx8MTYzMTE3OTYwOA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 18
perk = Perk.create!(
  name: "Half price staycation",
  description: "50% off of an airbnb in the UK.",
  location: BOROUGH.sample,
  token_cost: 120,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Airbnb"
)
file = URI.open('https://images.unsplash.com/photo-1591825692235-69e99d4189f3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8YWlyYm5ifHx8fHx8MTYzMDY3OTMzMw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 18
perk = Perk.create!(
  name: "A weekend of glamping",
  description: "Search through our selection of glamping stays and enjoy a 2 night weekend trip of your choice.",
  location: BOROUGH.sample,
  token_cost: 120,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Airbnb"
)
file = URI.open('https://images.unsplash.com/photo-1508974462591-3c124867fdf8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Z2xhbXBpbmd8fHx8fHwxNjMxMTc5MTYx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 19
perk = Perk.create!(
  name: "Monthly flowers",
  description: "Fancy treating yourself to monthly flowers? Or want to remind someone every month how great they are?
   Our flexible flower subscriptions are here to help. 12 month subscription!",
  location: BOROUGH.sample,
  token_cost: 90,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "subscription",
  merchants: "Bloom & Wild"
)
file = URI.open('https://images.unsplash.com/photo-1591350706059-15adf7a1df05?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Ym9xdWV0fHx8fHx8MTYzMDY3OTUwOQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 20
perk = Perk.create!(
  name: "Intensive Skate Lessons",
  description: "Inline and roller skating lessons in London · Beginner Level · Improver Level · (inc. SkateDance) · One
   Day Intensive Skate Lessons for Improver/Intermediate.",
  location: BOROUGH.sample,
  token_cost: 40,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "Skatefresh"
)
file = URI.open('https://images.unsplash.com/photo-1583832292569-7092d6d90873?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c2thdGluZ3x8fHx8fDE2MzExNzgyMzY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 20
perk = Perk.create!(
  name: "Skate Teacher Course",
  description: "Become a qualified skate teacher with this intensive course and be able to host inline and roller
   skating lessons in London · Beginner Level · Improver Level · (inc. SkateDance) · One Day Intensive Skate Lessons
   for Improver/Intermediate.",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "Skatefresh"
)
file = URI.open('https://images.unsplash.com/photo-1583832292569-7092d6d90873?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cm9sbGVyLXNrYXRpbmd8fHx8fHwxNjMxMDI3OTI0&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 21
perk = Perk.create!(
  name: "Beekeeping lessons",
  description: "Experience a Day in the Life of a Beekeeper... This workshop will take you inside a working London
   beehive to discover the world of the honeybee and its hive.",
  location: 'Unit 9, Old Water Yard, Dorking RH4 1DY',
  token_cost: 20,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "course",
  merchants: "The London Bee Company"
)
file = URI.open('https://images.unsplash.com/photo-1585326928390-7fd4e7c33dde?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8YmVla2VlcGVyfHx8fHx8MTYzMDY4NDYxOQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 22
perk = Perk.create!(
  name: "One month city travel",
  description: "Do you find that there is a lack of flexibility and control over choosing your daily mode of
   transportation? Have you always wanted to make a speedy, stress-free trip by avoiding congestion and minimizing air
   pollution? This token gives you a discounted Taa pass for one whole month!",
  location: BOROUGH.sample,
  token_cost: 80,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "travel",
  merchants: "Taa."
)
file = URI.open('https://images.unsplash.com/photo-1535659184496-06bea05c16c0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y3ljbGluZ3x8fHx8fDE2MzEwMjc3ODE&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 22
perk = Perk.create!(
  name: "Discounted office space",
  description: "Are you a start-up that needs somewhere to live as well as work? This perk offers you a 10% discount on
   work/places in London.",
  location: BOROUGH.sample,
  token_cost: 130,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "discount",
  merchants: "Workwise"
)
file = URI.open('https://images.unsplash.com/photo-1519389950473-47ba0277781c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8b2ZmaWNlfHx8fHx8MTYzMTAyNzc0Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 23
perk = Perk.create!(
  name: "Organic local food delivery",
  description: "Do you love organic fresh food? BeNatural has local farms that specialise in diary, vegetables, fruits
  and more!",
  location: BOROUGH.sample,
  token_cost: 30,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "Be Natural"
)
file = URI.open('https://images.unsplash.com/photo-1498191923457-88552caeccb3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8ZmFybXx8fHx8fDE2MzEwMjc3MTg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 23
perk = Perk.create!(
  name: "Budget helper",
  description: "Annual subscription to managing your budgets! When living in a new city on a budget one often struggles
   to find the most reliable shops, restaurants and shoe shops in Brick Lane! Do you need a site with a good
   price-performance ratio? YUDGET is here to help you!",
  location: BOROUGH.sample,
  token_cost: 40,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "YUDGET"
)
file = URI.open('https://images.unsplash.com/photo-1600628421055-4d30de868b8f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cmVzdGF1cmFudHx8fHx8fDE2MzEwMjc1OTk&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 24
perk = Perk.create!(
  name: "Streaming and snack service",
  description: "With the near infinite choice afforded by Amazon, Netflix and Deliveroo its easy to be paralysed by
   indecision. No more! Time you get a Whatever membership",
  location: BOROUGH.sample,
  token_cost: 20,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "Whatever"
)
file = URI.open('https://images.unsplash.com/photo-1585647347483-22b66260dfff?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9wY29ybnx8fHx8fDE2MzEwMjc1NTQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 25
perk = Perk.create!(
  name: "Discounted takeaway",
  description: "You know you want a specific food: let’s say Chicken Bhuna. How do you find the best one in town? Use
   Hungr to see images/ratings and find your dish! This perk allows you 10% off all orders for one month!",
  location: BOROUGH.sample,
  token_cost: 60,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "Hungr"
)
file = URI.open('https://images.unsplash.com/photo-1580781441945-3a233a33ff8c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dGFrZWF3YXl8fHx8fHwxNjMxMDI3NDUx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 26
perk = Perk.create!(
  name: "Tour booking membership",
  description: "Are you an up and coming artist that is looking to cut out the middle man and book their own tours? Get
   a discounted and exclusive membership with theGreenRoom!",
  location: BOROUGH.sample,
  token_cost: 170,
  start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 365),
  category: "membership",
  merchants: "theGreenRoom"
)
file = URI.open('https://images.unsplash.com/photo-1428992992979-aaeb02b6960c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Z2lnfHx8fHx8MTYzMTAyNzQyNg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating reviews for user
120.times do
  puts "creating reviews..."
  Review.create!(
    comment: Faker::Restaurant.review,
    rating: rand(1..5),
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id
  )
end

# creating user-perks - one problem is that they might go over their token amount as it's random and could too many for
# one user
10.times do
  puts "creating user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: false,
    favourited: false
  )
end

10.times do
  puts "creating user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: false,
    favourited: false
  )
end

20.times do
  puts "creating redeemed and faved user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: true,
    favourited: true
  )
end

20.times do
  puts "creating redeemed and faved user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: true,
    favourited: true
  )
end

20.times do
  puts "creating redeemed user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: true,
    favourited: false
  )
end

20.times do
  puts "creating redeemed user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: true,
    favourited: false
  )
end

15.times do
  puts "creating favourited user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: false,
    favourited: true
  )
end

15.times do
  puts "creating favourited user-perks..."
  UserPerk.create!(
    perk_id: Perk.all.sample.id,
    user_id: User.all.sample.id,
    redeemed: false,
    favourited: true
  )
end

# creating token bundle seeds

puts "creating tokens tiny bundle..."
Token.create!(
  bundle: '50 Extra Tokens',
  price_cents: 2500,
  amount: 50
)

puts "creating tokens small bundle..."
Token.create!(
  bundle: '100 Extra Tokens',
  price_cents: 5000,
  amount: 100
)

puts "creating tokens big bundle..."
Token.create!(
  bundle: '200 Extra Tokens',
  price_cents: 9500,
  amount: 200
)

puts "creating tokens XL bundle..."
Token.create!(
  bundle: '300 Extra Tokens',
  price_cents: 14000,
  amount: 300
)

puts "creating tokens XXL bundle..."
Token.create!(
  bundle: '400 Extra Tokens',
  price_cents: 18000,
  amount: 400
)
