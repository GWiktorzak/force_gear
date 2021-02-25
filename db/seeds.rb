require 'json'
require 'open-uri'
require 'faker'


36.times do 
  User.create!(username: Faker::Internet.username, email: Faker::Internet.free_email, password: Faker::Internet.password)
end

number = 1
4.times do
  url = "https://swapi.dev/api/starships/?page=#{number}"

  starships_seed = open(url).read
  starships_resource = JSON.parse(starships_seed)
  data = starships_resource['results']
  user_id = 1
  location = %s[London Paris Berlin Vienna Rome Madrid Lisbon Warsaw]
  lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
  rating = (0..5).to_a

  data.each do |starship|
    starship = Starship.create!(
      name: starship['name'],
      cost: starship['cost_in_credits'],
      description: lorem,
      rating: rating,
      user_id: User.last.id,
      location: location.sample
    )
    user_id += 1
    p starship.id
  end
  number += 1
end

puts "Finished"
