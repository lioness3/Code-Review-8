require('pry')
class Definition < Word
  attr_accessor :new_word, :new_definition, :definition1, :definition2, :definition3

  @@definitions = {}

  def initialize(new_word, new_definition)
    @new_word = new_word
    @new_definition = new_definition
    @definition1 = defintion1
    @defintion2 = defintion2
    @definition3 = defintion3
  end
  def self.all
    @@definitions.values
  end
  def save
    @@definitions[self.new_word] = Definition.new(self.new_word, self.new_definition)
  end
  def self.find(new_word)
    @@defintions[self.new_word]
  end
end