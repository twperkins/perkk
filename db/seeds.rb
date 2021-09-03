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
file = URI.open('https://images.unsplash.com/photo-1482029255085-35a4a48b7084?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dWJlcnx8fHx8fDE2MzA2NjczNjc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 1.5
perk = Perk.create!(
  name: "Two months membership",
  description: "50% off all orders, free delivery and exclusive discounts for two months!",
  location: BOROUGH.sample,
  token_cost: 150,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "membership",
  merchants: "Deliveroo"
)
file = URI.open('https://images.unsplash.com/photo-1610478920409-ec0f58e881a5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8ZGVsaXZlcm9vfHx8fHx8MTYzMDY2NzE0Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 2
perk = Perk.create!(
  name: "10 games of ping-pong",
  description: "Using this perk will allow you to have 10 free games in any bounce location in London.",
  location: '241 Old St, London EC1V 9EY',
  token_cost: 100,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "Bounce"
)
file = URI.open('https://images.unsplash.com/photo-1519162952575-c6c7199502a3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cGluZy1wb25nfHx8fHx8MTYzMDY2NzEyMA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1493235818145-77224bfd6e5c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8cGxhbmV8fHx8fHwxNjMwNjY3MDcz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1542823827-b6172875c7e9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dHJhaW58fHx8fHwxNjMwNjY3MDEz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1560828981-b0cd6639bff6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8YmljeWNsZXx8fHx8fDE2MzA2NjY5NTM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1605216406421-e54eba840e98?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8a2V3LWdhcmRlbnN8fHx8fHwxNjMwNjY2OTIw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1552944150-6dd1180e5999?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2F0fHx8fHx8MTYzMDY2Njg4Ng&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1613046462996-4c586c685925?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c2N1YmEtZGl2aW5nfHx8fHx8MTYzMDY2Njg2NA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1517208268027-690eee3d356f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8dW5pY3ljbGV8fHx8fHwxNjMwNjY2NjUy&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1584671986324-fc1ce89a5b07?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c3VzaGl8fHx8fHwxNjMwNjY3NDE0&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1574966739987-65e38db0f7ce?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8ZGluaW5nfHx8fHx8MTYzMDY2NzUzNw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1583417267826-aebc4d1542e1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c3BhfHx8fHx8MTYzMDY2NzU2Ng&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1591343395082-e120087004b4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8c3BhfHx8fHx8MTYzMDY2NzY1Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
file = URI.open('https://images.unsplash.com/photo-1559564484-948476f9e72a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FuYWwtYm9hdHx8fHx8fDE2MzA2Njc4NDM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
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
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "course",
  merchants: "Bonsai empire"
)
file = URI.open('https://source.unsplash.com/1600x800/?bonsai')
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
file = URI.open('https://source.unsplash.com/1600x800/?go-kart')
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
file = URI.open('https://source.unsplash.com/1600x800/?mystery')
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
file = URI.open('https://source.unsplash.com/1600x800/?wellbeing')
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
file = URI.open('https://source.unsplash.com/1600x800/?kusama')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 17
perk = Perk.create!(
  name: "Museum membership",
  description: "Enjoy exclusive Members Hours, incredible shows, discounts, all-access to all archives, and more. Free
   entry for Members. Join us at the National Gallery today.",
  location: 'Trafalgar Square, London WC2N 5DN',
  token_cost: 150,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "membership",
  merchants: "National Gallery"
)
file = URI.open('https://source.unsplash.com/1600x800/?design')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 16
perk = Perk.create!(
  name: "10 week Web Dev bootcamp",
  description: "Learn HTML, CSS, JS and More! Save Your Seat. Sign Up Today. Award-Winning Curriculum. Join Our Tech
   Community. Learn Now & Pay Later. Learn Cutting Edge Skills. Financing Opportunities. Part-Time and Full-Time. Learn
   On Campus & Online.",
  location: 'Shoreditch Stables, North, 138 Kingsland Rd, London E2 8DY',
  token_cost: 400,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "course",
  merchants: "Le Wagon"
)
file = URI.open('https://source.unsplash.com/1600x800/?coding')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 17
perk = Perk.create!(
  name: "Orange Wednesdays",
  description: "Two cinema tickets for the price of one on any Wednesday.",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "social",
  merchants: "Orange Network"
)
file = URI.open('https://source.unsplash.com/1600x800/?cinema')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 18
perk = Perk.create!(
  name: "Half price staycation",
  description: "50% off of an airbnb in the UK.",
  location: BOROUGH.sample,
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "travel",
  merchants: "Airbnb"
)
file = URI.open('https://images.unsplash.com/photo-1591825692235-69e99d4189f3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8YWlyYm5ifHx8fHx8MTYzMDY3OTMzMw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating perk 19
perk = Perk.create!(
  name: "Monthly flowers",
  description: "Fancy treating yourself to monthly flowers? Or want to remind someone every month how great they are?
   Our flexible flower subscriptions are here to help. 12 month subscription!",
  location: BOROUGH.sample,
  token_cost: 100,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
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
  token_cost: 50,
  start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
  category: "course",
  merchants: "Skatefresh"
)
file = URI.open('https://source.unsplash.com/1600x800/?cinema')
perk.perk_pic.attach(io: file, filename: 'test.png', content_type: 'image/png')

# creating reviews for user
rand(2..7).times do
  puts "creating reviews..."
  Review.create!(
    comment: Faker::Restaurant.review,
    rating: rand(0..5),
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
