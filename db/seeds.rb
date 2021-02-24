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
  location = "London"

  data.each do |starship|
    starship = Starship.create!(
      name: starship['name'],
      model: starship['model'],
      manufacturer: starship['manufacturer'],
      cost: starship['cost_in_credits'],
      length: starship['length'],
      max_speed: starship['max_atmosphering_speed'],
      crew: starship['crew'],
      passengers: starship['passengers'],
      cargo_capacity: starship['cargo_capacity'],
      starship_class: starship['starship_class'],
      user_id: User.last.id,
      location: location
    )
    user_id += 1
    p starship.id
  end
  number += 1
end
