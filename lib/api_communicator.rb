require 'rest-client'
require 'json'
require 'pry'



films_hash = {}


def get_movies_from_api(films)
  films.collect do |url|
    all_films = RestClient.get(url)
    JSON.parse(all_films)
  end
end 


def get_character_movies_from_api(character)
  #make the web request
  url = "http://www.swapi.co/api/people/"
  more_characters = ""
  character_hash = []
  while more_characters != nil
    all_characters = RestClient.get(url)
    character_hash.push(JSON.parse(all_characters))
    url = character_hash[-1]["next"]
    more_characters = character_hash[-1]["next"]
  end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  character_hash.each do |person|
    person.each do |key, value|
      if key == "results"
        value.each do |traits|
          if traits["name"].upcase == character.upcase
            return get_movies_from_api(traits["films"])
          end
        end 
      end 
    end
  end

end




def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    puts "Film Title: #{film["title"]}"
    puts "     Episode: #{film["episode_id"]}"
    puts "     Director: #{film["director"]}"
    puts "     Producer: #{film["producer"]}"
    puts "     Release Date: #{film["release_date"]}"
    puts "Opening Crawl: #{film["opening_crawl"]}"
    puts "---------------------------------------------"
  end
end


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
