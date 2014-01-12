require './animal'
require './shelter'
require './client'
require 'pry'

shelter = Shelter.new("HappiTails Shelter")

controller_options = {
  "1" => "Display all animals",
  "2" => "Display all clients",
  "3" => "Add an animal",
  "4" => "Add a client",
  "5" => "Animal adoption"
}

# A menu method, that displays menu options, a header message,
# and output from last command
# Also gets (and returns) input from user
def menu(output_messages, menu_options)
  puts(`clear`)

  # Display output from last command
  output_messages.each { |line| puts(line) }

  puts()
  puts("*** HappiTails Shelter v1.0 ***\n\n")

  # print any passed in message and menu header
  # puts(message)
  puts("Please select an option...\n\n")

  # print menu options
  menu_options.each { |k, v| puts("  #{k}. #{v}") }

  puts()
  puts("   press 'q' to quit.")

  # print a blank line and prompt.
  puts()
  print('--> ')

  # get and return input
  result = gets.chomp
  puts()
  return result
end

output_messages = []
choice = menu(output_messages, controller_options)

# process user commands, until user enters quit command 'q'
while choice != 'q'

output_messages = []

  case choice
  when "1"
    output_messages = shelter.formatted_animal_list

  when "2"
    output_messages = shelter.formatted_client_list

  when "3" 
    new_animal = Animal.new
    new_animal.get_new_animal_info
    output_messages = shelter.add_animal(new_animal)

  when "4"    
    new_client = Client.new
    new_client.get_new_client_info
    output_messages = shelter.add_client(new_client)

  when "5"
    output_messages = shelter.get_adoption_info

  else
    output_messages << "Invalid option. Try again."
  end
  
  choice = menu(output_messages, controller_options)
end
