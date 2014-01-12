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
    @pets = []   
  end

  # # Method to show number of pets, based on how many pets are in pet list
  # def number_of_pets
  #   @pets.count
  # end

  # Method to add a new pet to this client
  def add_pet(pet)
    @pets.push(pet)
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
    output_info << "Pets:     #{@pets.count}"
    @pets.each { |pet| output_info << "   #{pet.name} is #{pet.age}, and likes to play with #{pet.toys}." }
    # add a blank line
    output_info << " "
    return output_info
  end

end
