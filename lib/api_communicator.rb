require 'rest-client'
require 'json'
require 'pry'

# response_string = RestClient.get('http://www.swapi.co/api/people/?format=json')
# response_hash = JSON.parse(response_string)
#
# binding.pry
#
# 0
def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/?format=json')
  response_hash = JSON.parse(response_string)

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  results_arr = response_hash["results"]
  film_arr=[]
  results_arr.each do |person_hash|
    if person_hash["name"] == character
      film_arr = person_hash["films"]
    end
  end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

  film_arr
end

# films_arr =  [
#         "https://www.swapi.co/api/films/2/",
#         "https://www.swapi.co/api/films/6/",
#         "https://www.swapi.co/api/films/3/",
#         "https://www.swapi.co/api/films/1/",
#         "https://www.swapi.co/api/films/7/"
#       ]


def print_movies(films_hash)
  titles_arr = []
  films_hash.each do |movie_link|
    movie_info_hash = JSON.parse(RestClient.get(movie_link))
    titles_arr.push(movie_info_hash["title"])
  end
  puts titles_arr
end



def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
