require './animal'
require './shelter'
require './client'

shelter = Shelter.new("HappiTails Shelter")

controller_options = {
  "1" => "Create an animal.",
  "2" => "Create a client.",
  "3" => "Display all clients"
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
    new_animal = Animal.new
    new_animal.get_new_animal_info
    output_messages << "New animal created."

  when "2"    
    new_client = Client.new
    new_client.get_new_client_info
    shelter.add_client(new_client)
    output_messages << "New client created and added."

  when "3"
    output_messages = shelter.formatted_client_list

  else
    output_messages << "Invalid option. Try again."
  end
  
  choice = menu(output_messages, controller_options)
end
