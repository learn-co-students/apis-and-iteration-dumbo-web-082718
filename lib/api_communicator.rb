require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  films_hash = []
  character_hash = get_character_hash(character)
  character_hash["films"].each do |film|
    films_hash << get_response(film)
  end
  films_hash
end

def get_character_hash(character)
  get_response["results"].find do |character_hash|
    character_hash["name"] == character || character_hash["name"].downcase == character
  end
end

def get_response(link = 'http://www.swapi.co/api/people/')
  response_string = RestClient.get(link)
  response_hash = JSON.parse(response_string)
  response_hash
end

def print_movies(films_hash)
  films_hash.each do |film|
    puts film["title"]
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
