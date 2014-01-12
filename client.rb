class Client

  # make these attributes available to be seen
  attr_reader :name

  # initialize instance variables
  def initialize(name="", age=0, number_of_children=0)
    #implement
    @name = name
    @age = age
    @number_of_children = number_of_children
    # create an empty array to store adopted animal (clients new pets!)
    @pets = {}   
  end

  # Method to add a new pet to this client
  def add_pet(pet)
    @pets[pet.name.to_sym] = pet
  end

  # Convenience Method, to provide number of pets
  def number_of_pets
    @pets.keys.count
  end

  # Method to prompt, collect, and assign client info to current client obj
  def get_new_client_info
    print("Please enter name: ")
    @name = gets.chomp

    print("Enter age: ")
    @age = gets.chomp.to_i

    print("Enter number of children: ")
    @number_of_children = gets.chomp.to_i
  end

  # Method to display client info (attributes) of current client obj
  def formatted_client_display_info
    output_info = []
    output_info << "Name:     #{@name}"
    output_info << "Age:      #{@age}"
    output_info << "Children: #{@number_of_children}"
    output_info << "Pets:     #{self.number_of_pets}"
    @pets.each { |k, pet| output_info << "   #{pet.name} is #{pet.age}, and likes to play with... #{pet.toys}" }
    # add a blank line
    output_info << " "
    return output_info
  end

 # Method to find a valid/existing pet of a client, return that object
  def choose_pet
      
      selected_pet = "" 
      print("Enter pet name: ")
      selected_pet = gets.chomp

      until @pets.member?(selected_pet.to_sym) do
        puts("That pet not found. Please try again.")
        print("Enter pet name: ")
        selected_pet = gets.chomp
      end

      return @pets[selected_pet.to_sym]
  end

  # Method to select pet (choose a pet of client), and remove from client pet list
  def turnover_pet
    selected_pet = choose_pet()
    @pets.delete(selected_pet.name.to_sym)   # remove the pet from clients pet list

    return selected_pet
  end

end
