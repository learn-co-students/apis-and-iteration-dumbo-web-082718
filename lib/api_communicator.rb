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


  # page_number = 1
  response_hash = make_request('http://www.swapi.co/api/people/')
  characters_array = []
  characters_array = characters_array.concat(response_hash["results"])
  # binding.pry
  while response_hash["next"] != nil
    # binding.pry
    response_hash = make_request(response_hash["next"])
    # response_hash = make_request('http://www.swapi.co/api/people/?page=' + "#{page_number}")

    characters_array = characters_array.concat(response_hash["results"])

  # page_number +=1
  end


  characters_array.each do |character_hash|
    if character_hash["name"] == character
      return character_hash["films"]
    end
  # characters_array["results"].each do |person|

      # if character == person["name"]
        # return person["films"]
      # end
    # end
  end
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
