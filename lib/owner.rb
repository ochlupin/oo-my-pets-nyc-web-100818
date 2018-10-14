# Owner class should know about it's pets,be able to buy a pet, set the name of a pet, change the pet's mood (through walking, feeding, or playing), and send all of its pets
require 'pry'

class Owner

  @@all = []

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @@all << self
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
  end

  # !!!CLASS METHODS!!!
  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  # !!!INSTANCE METHODS!!!

  def say_species
    "I am a #{self.species}."
  end

  # the buy_fish,buy_dog,buy_cat methods shovels a new instance of each of the respective class (with a name passed as an argument) inside the appropriate key (which is an array) inside the @pets hash
  def buy_fish (name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_dog (name)
    @pets[:dogs] << Dog.new(name)
  end

  def buy_cat (name)
    @pets[:cats] << Cat.new(name)
  end

  # the walk_dogs, play_with_cats,feed_fish methods iterate through the list of dogs,cats and fishes (which are arrays but also hash keys inside the @pets hash) and alter the mood instance attribute (the mood instance variables are available because we shoved the intances of Dog, Cat and Fish class in the @pets hash previously through buy_fish,buy_cat and buy_dog)
  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  # sell_pets method does 2 things:
  # 1. sets the mood of pets to "nervous"
  # 2. removes them from the owner (i.e. removes them from @pets hash)
  def sell_pets
    # this iterates through the hash, pet_type(keys) & pets(values)
    self.pets.each do |pet_type,pets|
      # this accesses the value themselves and alters the .mood instance variable
      pets.each do |pet|
        pet.mood = "nervous"
      end
      #this will clear the values from pet_type keys (i.e. :fishes, :dogs, :cats)
      pets.clear
    end
  end

  # this method will list the number of pets from each species that the owner has

  def list_pets
    "I have #{self.pets[:fishes].size} fish, #{self.pets[:dogs].size} dog(s), and #{self.pets[:cats].size} cat(s)."
  end

end # End of Owner Class
