require_relative "api_communicator.rb"

def welcome
  # puts out a welcome message here!
  puts "Greeting, Star Wars fan!"
end

def get_character_from_user
  puts "Please enter a character name to see the movies they appear in: "
  character = gets.chomp.downcase 
  until get_character_movies_from_api(character) != nil
  	puts "I'm sorry, we couldn't find that. Please enter another character name to see the movies they appear in: "
  	character = gets.chomp.downcase 
  end
  # use gets to capture the user's input. This method should return that input, downcased.
  character
end
