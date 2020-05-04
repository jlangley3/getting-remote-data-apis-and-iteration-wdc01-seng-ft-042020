require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  base_url = 'http://swapi.dev/api/people/?search='
  query_url = base_url + character_name.gsub(' ', '+')
  response_string = RestClient.get(query_url)
  response_hash = JSON.parse(response_string)
  validate_results(response_hash)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def validate_results(character)
  if character["results"].length > 0
    fetch_films(character)
  else
    return "No Results Found"
  end 
end

def fetch_films(character)
  film_array = character["results"][0]["films"].collect do |film|
    film_data = JSON.parse(RestClient.get(film))
    film_data["title"]
  end
end

def print_movies(films)
  i = 0
  while i < films.length
    puts (i + 1).to_s + " " + films[i]
    i += 1
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  if films.is_a?(String)
    puts films
  else
    print_movies(films)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
