require './controller'
require './shelter'
require 'pry'

# 
# Menu 							Option 																	Option
# Option 						text  																	method
#
menu_options = {
  "1" => { text: "Display all animals",	method: Proc.new { shelter.formatted_animal_list } } ,
  "2" => { text: "Display all clients",	method: Proc.new { shelter.formatted_client_list } } ,
  "3" => { text: "Add an animal",				method: Proc.new { shelter.add_new_animal } } ,
  "4" => { text: "Add a client",				method: Proc.new { shelter.add_new_client } } ,
  "5" => { text: "Animal adoption",			method: Proc.new { shelter.process_adoption } } ,
  "6" => { text: "Put up for adoption",	method: Proc.new { shelter.accept_for_adoption } } 
}

shelter = Shelter.new("HappiTails Shelter")

# pass the menu, and shelter name (for the title) to the controller
controller = Controller.new(menu_options, shelter.name)

# run the menu
controller.start(shelter)
