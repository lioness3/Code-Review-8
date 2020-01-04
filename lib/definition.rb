require('pry')
class Definition < Word
  attr_accessor :new_word, :new_definition, :alternate_definition

  @@definitions = {}

  def initialize(new_word, new_definition, alternate_definition)
    @new_word = new_word
    @new_definition = new_definition
    @alternate_definition = alternate_definition
  end
  def self.all
    @@definitions.values
  end
  def ==(word_to_compare)
    self.new_word == word_to_compare.new_word()
  end
  def save
    @@definitions[self.new_word] = Definition.new(self.new_word, self.new_definition, self.alternate_definition)
  end
  def self.find(new_word)
    @@definitions[self.new_word]
  end
  def add_definition(alternate_definition)
    @alternate_definition = alternate_definition
  end
  def self.clear
    @@definitions = {}
  end
  def delete_one(string)
    @@definitions.invert.delete(string)
  end
end
