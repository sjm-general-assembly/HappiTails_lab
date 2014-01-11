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
  def get_new_client_info
    print("Please enter name: ")
    @name = gets.chomp

    print("Enter age: ")
    @age = gets.chomp.to_i

    print("Enter number of children: ")
    @number_of_children = gets.chomp.to_i
  end


end
