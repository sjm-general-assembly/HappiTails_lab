class Client
  #basic properties
  # attr_accessor :name, :age, :number_of_children, :number_of_pets = number_of_pets
  attr_reader :output_message

  # initialize instance variables
  def initialize(name="", age=0, number_of_children=0)
    #implement
    @name = name
    @age = age
    @number_of_children = number_of_children
    # @number_of_pets = number_of_pets

    @output_message = "Created a new client."
  end

end
