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

end
