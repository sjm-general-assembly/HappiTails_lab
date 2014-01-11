require './animal'
require './shelter'
require './client'

shelter = Shelter.new("HappiTails Shelter")

controller_options = {
  "1" => "Create an animal.",
  "2" => "Create a client."
}

# A menu method, that displays menu options, a header message,
# and gets (and returns) input from user
def menu(message, menu_options)
  puts `clear`
  puts "*** HappiTails Shelter v1.0 ***\n\n"

  # print any passed in message and menu header
  puts(message)
  puts "\nPlease select an option...\n\n"

  # print menu options
  menu_options.each { |k, v| puts("  #{k}. #{v}") }

  # print a blank line and prompt.
  puts()
  print '--> '

  # get and return input
  result = gets.chomp
  return result
end

output_message = ""
choice = menu(output_message, controller_options)

# process user commands, until user enters quit command 'q'
while choice != 'q'
  
  case choice
  when "1" 
    output_message = Animal.new.output_message
  when "2"    
    output_message = Client.new.output_message
  else
    output_message = "Invalid option. Try again."
  end
  
  choice = menu(output_message, controller_options)
end
