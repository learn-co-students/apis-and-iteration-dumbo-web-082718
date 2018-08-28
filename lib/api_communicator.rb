require 'rest-client'
require 'json'
require 'pry'

def make_request(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def get_character_movies_from_api(character)
  #make the web request
  # response_string = RestClient.get('http://www.swapi.co/api/people/')
  # response_hash = JSON.parse(response_string)
  response_hash = make_request('http://www.swapi.co/api/people/')

  response_hash["results"].each do |person|

    if character == person["name"]
      return person["films"]
    end
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
end



def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  titles_array = []
  films_array.each do |film_url|
    # response_string = RestClient.get(film_url)
    # response_hash = JSON.parse(response_string)
    # array_of_hashes << response_hash
    titles_array << make_request(film_url)["title"]
  end
  puts titles_array
end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
