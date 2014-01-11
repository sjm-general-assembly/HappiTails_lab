class Animal
  #basic properties
  # attr_accessor :name, :age, :gender, :species, :toys
  attr_reader :output_message

  # initialize instance variables
  def initialize(name="", age=0, gender="", species="", toys=[])
    #implement
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = toys

    @output_message = "Created a new animal."
  end

end
