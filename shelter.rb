require 'pry'

class Shelter

  # initialize instance variables
  def initialize(shelter_name="")
    # assign provided name to new object
    @name = shelter_name

    # create an empty array, to store added clients
    @clients = []

    # create an empty array, to store added animals
    @animals = []
  end

  # Method to add a newly created client to shelter client list
  def add_client(new_client)
    @clients.push(new_client)
  end

  # Method to format an output string of all current clients of shelter
  def formatted_client_list
    output_strings = []
    if @clients.count == 0
      output_strings << "No clients to display."
    else
      output_strings << "---- Client List ----"
      @clients.each { |client| output_strings += client.formatted_client_display_info }
    end
    return output_strings
  end

  # Method to add a newly created animal to shelter animal list
  def add_animal(new_animal)
    @animals.push(new_animal)
  end

  # Method to format an output string of all current animals of shelter
  def formatted_animal_list
    output_strings = []
    if @animals.count == 0
      output_strings << "No animals to display."
    else
      output_strings << "---- Animal List ----"
      @animals.each { |animal| output_strings += animal.formatted_animal_display_info }
    end
    return output_strings
  end

  # Method to prompt and collect info needed to
  # complete an adoption (client name, pet name)
  def get_adoption_info

    output_strings = []
    # Check to see if there are any pets available to adopt.
    # If not, no need to collect info.
    if @animals.count == 0
      output_strings << "There are no animals available to adopt at this time. Please come back again."
    elsif @clients.count == 0
      output_strings << "There are no clients. In order to adopt, person must be a client first."
    else
      # collection info needed to adopt
      puts("-- Collect Adoption Information --")
      gets
      # adopting_client_name = "" 
      # until @clients.include? adopting_client_name
      #   puts("Enter client name: ")
      #   adopting_client_name = gets.chomp
      #   if @clients.include? adopting_client_name
      #     puts("That client not found. Please try again.")
      #   end
      # end
      output_strings << "Adoption in progress."
    end
  end
  
end
