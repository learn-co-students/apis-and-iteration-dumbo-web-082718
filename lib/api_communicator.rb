require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |character_info|
    character_info.each do |key, value|
      if value == character
        return character_info["films"]
      end
    end
  end
end

def title_generater(url)
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    response_hash["title"]
    #binding.pry
end
#title_generater("https://www.swapi.co/api/films/5/")

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
  #  of movies by title. play around with puts out other info about a given film.)

def print_movies(character)
  films_array = get_character_movies_from_api(character)
  films_array.map.with_index(1) do |film, index|
    "#{index} " + title_generater(film)
  end
end
#puts print_movies("Luke Skywalker")


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(character)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
