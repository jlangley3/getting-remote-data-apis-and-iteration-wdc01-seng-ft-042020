require 'rest-client'
require 'json'
require 'pry'

def welcome
  puts "Whats up! Welcome to Star Wars Movie Finder"
  # puts out a welcome message here!
end

def get_character_from_user
  puts "please enter a character name"
  input = gets.chomp
if input.empty?
  puts "You did not put anything in!"
  get_character_from_user
end
input
  # use gets to capture the user's input. This method should return that input, downcased.
end
