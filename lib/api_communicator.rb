require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # binding.pry
  found_character = {}
  response_hash["results"].each do |character_hash|
    if character.downcase == character_hash["name"].downcase
      found_character = character_hash
    end
  end
  found_character["films"]
end
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
# puts get_character_movies_from_api("Luke Skywalker")

# films =[
#                 "https://www.swapi.co/api/films/2/",
#                 "https://www.swapi.co/api/films/6/",
#                 "https://www.swapi.co/api/films/3/",
#                 "https://www.swapi.co/api/films/1/",
#                 "https://www.swapi.co/api/films/7/"
#             ],

def print_movies(films_hash)
  movies = []
   films_hash.each do |film|
     movies.push(JSON.parse(RestClient.get(film))["title"])
    # binding.pry
  end
    puts movies
    # some iteration magic and puts out the movies in a nice list
 end
# print_movies(get_character_movies_from_api("Luke Skywalker"))


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  # binding.pry
  print_movies(films_array)
end

# show_character_movies("R2-D2")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
