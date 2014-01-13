require './controller'
require './shelter'
require 'pry'

menu_options = {
  "1" => "Display all animals",
  "2" => "Display all clients",
  "3" => "Add an animal",
  "4" => "Add a client",
  "5" => "Animal adoption",
  "6" => "Put up for adoption"
}

shelter = Shelter.new("HappiTails Shelter")
controller = Controller.new(menu_options)
controller.start(shelter)
