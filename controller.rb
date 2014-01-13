require './shelter'

class Controller 

  # initialize instance variables
  def initialize(menu_options="")
    @menu_options = menu_options
  end

  # A menu method, that displays menu options, a header message,
  # and output from last command
  # Also gets (and returns) input from user
  def menu(output_messages, header)
    puts(`clear`)

    # Display output from last command
    output_messages.each { |line| puts(line) }

    puts()
    puts("*** #{header} ***\n\n")

    # print any passed in message and menu header
    # puts(message)
    puts("Please select an option...\n\n")

    # print menu options
    @menu_options.each { |k, v| puts("  #{k}. #{v}") }

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

  # Method that takes a menu hash, and processes user input
  def start(working_object)

    output_messages = []
    choice = menu(output_messages, working_object.name)

    # process user commands, until user enters quit command 'q'
    while choice != 'q'

    output_messages = []

      case choice
      when "1"
        output_messages = working_object.formatted_animal_list()

      when "2"
        output_messages = working_object.formatted_client_list()

      when "3" 
        output_messages = working_object.add_new_animal()

      when "4"    
        output_messages = working_object.add_new_client()

      when "5"
        output_messages = working_object.process_adoption()

      when "6"
        output_messages = working_object.accept_for_adoption()

      else
        output_messages << "Invalid option. Try again."
      end
      
      choice = menu(output_messages, working_object.name)
    end

  end

  # choice = nil
  # until choice == 'q'

  #   output_messages = []
  #   choice = menu(output_messages, working_object.name)

  #   if @menu_options.member?(choice.to_sym)
  #     yield(@menu_options[choice.to_sym].block)
  #   else
  #       output_messages << "Invalid option. Try again."
  #   end
  # end

end