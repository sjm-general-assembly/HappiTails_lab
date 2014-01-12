require 'pry'

class Shelter

  # initialize instance variables
  def initialize(shelter_name="")
    # assign provided name to new object
    @name = shelter_name

    # create an empty hash, to store added clients (name of client will be key)
    @clients = {}

    # create an empty hash, to store added animals (name of animal will be key)
    @animals = {}
  end

  # Method to add a newly created client to shelter client list
  def add_client(new_client)
    output_strings = []
    if @clients[new_client.name.to_sym].nil?
      @clients[new_client.name.to_sym] = new_client
      output_strings << "New client #{new_client.name} added."
    else
      output_strings << "That client already exists. Not adding again."
    end
  end

  # Method to format a list of output strings, of all current clients of shelter
  def formatted_client_list
    output_strings = []
    if @clients.empty?
      output_strings << "No clients to display."
    else
      output_strings << "---- Client List ----"
      @clients.each { |k, client| output_strings += client.formatted_client_display_info }
    end
    return output_strings
  end

  # Method to add a newly created animal to shelter animal list
  def add_animal(new_animal)
    output_strings = []

    # add animal if it doesn't exist yet
    if @animals[new_animal.name.to_sym].nil?
      @animals[new_animal.name.to_sym] = new_animal
      output_strings << "New animal #{new_animal.name} added."
    else
      output_strings << "That animal already exists. Not adding again."
    end
  end

  # Method to format an output string of all current animals of shelter
  def formatted_animal_list
    output_strings = []
    if @animals.empty?
      output_strings << "No animals to display."
    else
      output_strings << "---- Animal List ----"
      @animals.each { |k, animal| output_strings += animal.formatted_animal_display_info }
    end
    return output_strings
  end

  # Method to find a valid/existing client, return that object
  def input_valid_client
      
      adopting_client_name = "" 
      print("Enter client name: ")
      adopting_client_name = gets.chomp

      while @clients[adopting_client_name.to_sym].nil?
        puts("That client not found. Please try again.")
        print("Enter client name: ")
        adopting_client_name = gets.chomp
      end

      return @clients[adopting_client_name.to_sym]
  end

  # Method to find a valid/existing animal, return that object
  def input_valid_animal
      
      adopting_animal_name = "" 
      print("Enter animal name: ")
      adopting_animal_name = gets.chomp

      while @animals[adopting_animal_name.to_sym].nil?
        puts("That animal not found. Please try again.")
        print("Enter animal name: ")
        adopting_animal_name = gets.chomp
      end

      return @animals[adopting_animal_name.to_sym]
  end
    
  # Method to complete an adoption (client name, pet name)
  def process_adoption

    output_strings = []
    # Check to see if there are any pets available to adopt and clients added.
    # If not, no need to collect info.
    if @animals.empty?
      output_strings << "There are no animals available to adopt at this time. Please come back again."
    elsif @clients.empty?
      output_strings << "There are no clients. In order to adopt, person must be a client first."
    else
      # collection info needed to adopt
      puts("-- Collect Adoption Information --")
      adopting_client = input_valid_client()
      animal_to_adopt = input_valid_animal()

      # add the pet to the client, and remove from shelter animal list
      # we know at this point, both exist
      @clients[adopting_client.name.to_sym].add_pet(animal_to_adopt)
      @animals.delete(animal_to_adopt.name.to_sym)

      output_strings << "#{adopting_client.name} has provided a new home for #{animal_to_adopt.name}!"
    end
  end

  # Method to process receiving an animal for adoption.
  def accept_for_adoption
  
    output_strings = []
    # Check to see if there are any clients  
    if @clients.empty?
      output_strings << "There are no clients. In order to put up an animal for adoption, person must be a client first."
    else
      # collection info needed to adopt  (name of client, and pet)
      puts("-- Collect Adoption Information --")
      adopting_client = input_valid_client()

      if adopting_client.number_of_pets == 0
        output_strings << "#{adopting_client.name} does not have any pets to give..."
      else
        # at this point, we know we have a valid client, who does have at least 1 pet.
        current_pet = adopting_client.turnover_pet()   # returns chosen pet, and pet is removed from client list
        output_strings << "#{adopting_client.name} has given #{current_pet.name} to the shelter, to find a better home."
      end
    end
  end
  
end
