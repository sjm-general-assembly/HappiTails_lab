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

  # Method to add an newly created client to shelter client list
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
      @clients.each do |client|
      client_output = client.formatted_client_display_info
            binding.pry
      output_strings += client_output
      end
    end
    return output_strings
  end

  # def add_animal
  # end

end
