def welcome
  # puts out a welcome message here!
  puts "Greeting, Star Wars fan!"
end

def get_character_from_user
  puts "Please enter a character name to see the movies they appear in: "
  gets.chomp.downcase 
  # use gets to capture the user's input. This method should return that input, downcased.
end
