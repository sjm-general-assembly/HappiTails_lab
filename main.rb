require './controller'
require './shelter'
require 'pry'

# 
# Menu 		Menu 										Method
# Option 	Text
#
menu_options = {
	# this is currently not functional!
	# you'll need to refactor your code anywhere you use menu_options
  "1" => { formatted_animal_list: "Display all animals" } ,
  "2" => ["Display all clients",	:formatted_client_list],
  "3" => ["Add an animal",		:add_new_animal],
  "4" => ["Add a client",		:add_new_client],
  "5" => ["Animal adoption",		:process_adoption],
  "6" => ["Put up for adoption",	:accept_for_adoption]
}

shelter = Shelter.new("HappiTails Shelter")
controller = Controller.new(menu_options)
controller.start(shelter)
