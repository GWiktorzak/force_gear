require 'json'
require 'open-uri'

number = 1
4.times do
  url = "https://swapi.dev/api/planets/?page=#{number}"

  starships_seed = open(url).read
  starships_resource = JSON.parse(starships_seed)
  data = starships_resource['results']
  user_id = 1

  data.each do |starship|
    Starship.create(
      name: starship['name'],
      model: starship['model'],
      cost: starship['cost_in_credits'],
      length: starship['length'],
      max_speed: starship['max_atmosphering_speed'],
      crew: starship['crew'],
      cargo_capacity: starship['cargo_capacity'],
      starship_class: starship['starship_class'],
      user_id: user_id
    )
    user_id += 1
  end
  number += 1
end