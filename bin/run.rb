#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

require 'rest-client'
require 'json'
require 'pry'

welcome
character = get_character_from_user
show_character_movies(character)


#https://swapi.dev/

#https://swapi.dev/api/people/1/

# character_data = RestClient.get('http://swapi.dev/api/people/5')
 
# puts JSON.parse(character_data)