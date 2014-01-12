class Animal

  # initialize instance variables
  def initialize(name="", age=0, gender="", species="", toys=[])
    #implement
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = toys
  end

  # Method to prompt, collect, and assign client info to current client obj
  def get_new_animal_info
    print("Please enter animal name: ")
    @name = gets.chomp

    print("Enter animal age: ")
    @age = gets.chomp.to_i

    print("Please enter animal gender: ")
    @gender = gets.chomp

    print("Please enter animal species: ")
    @species = gets.chomp

    print("Please enter animal toys: ")
    @toys = gets.chomp
  end

  # Method to display client info (attributes) of current client obj
  def formatted_animal_display_info
    output_info = []
    output_info << "Name:    #{@name}"
    output_info << "Age:     #{@age}"
    output_info << "Gender:  #{@gender}"
    output_info << "Species: #{@species}"
    output_info << "Toys:    #{@toys}"
    # add a blank line
    output_info << " "
    return output_info
  end


end
