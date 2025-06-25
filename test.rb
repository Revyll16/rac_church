class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def birthday
    @age += 1
    puts "Happy birthday, #{@name}! You are now #{@age} years old."
  end
end

# Création d'un objet Person
person = Person.new("Revyll", 30)

# Appel de la méthode birthday
person.birthday
