def welcome
   puts "Welcome to Star Wars Api"

   puts
end

def get_character_from_user

  puts "Please enter a character:"
input =  gets.chomp.downcase
return input
  # use gets to capture the user's input. This method should return that input, downcased.
end
