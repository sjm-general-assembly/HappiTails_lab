
class Controller 

  # initialize instance variables
  def initialize(menu_options="", menu_title="")
    @menu_options = menu_options
    @menu_title = menu_title
  end

  # A menu method, that displays menu options, a header message,
  # and output from last command
  # Also gets (and returns) input from user
  def menu(output_messages)
    puts(`clear`)

    # Display output from last command
    output_messages.each { |line| puts(line) }

    puts()
    puts("*** #{@menu_title} ***\n\n")

    # print any passed in message and menu header
    # puts(message)
    puts("Please select an option...\n\n")

    # print menu options
    @menu_options.each { |k, v| puts("  #{k}. #{v[:text]}") }

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

    choice = nil
    until choice == 'q'

      output_messages = []
      choice = menu(output_messages)

      if @menu_options.member?(choice)
        # binding.pry
        # syntax not quite correct. need to fix.  TODO SJM
        working_object.send @menu_options[choice][:method]
      else
        output_messages << "Invalid option. Try again."
      end
    end    

  end

  

end