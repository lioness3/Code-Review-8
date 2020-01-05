require('pry')
# first_name = ARGV[0]
# last_name = ARGV[1]
# age = ARGV[2]
# puts "This is ARGV, the arguments array: #{ARGV}."
# puts "Hello #{first_name} #{last_name}. You are #{age} years old!"
class Word
  attr_accessor :new_word, :new_definition, :study_terms, :alternate_definition
  @@study_terms = {}

  def initialize(new_word, new_definition)
    @new_word = new_word
    @new_definition = new_definition
  end

  def save
    @@study_terms[self.new_word] = Word.new(self.new_word, self.new_definition)
  end

  def self.all
    @@study_terms.values()
  end

  def ==(word_to_compare)
    self.new_word == word_to_compare.new_word()
  end
  def add_definition(definition_to_add)
    @alternate_definition = definition_to_add
    return @@study_terms[self.new_word]= @new_definition, @alternate_definition
  end

  def edit(redefined)
    if  @new_definition
      return self.new_definition.replace(redefined)
    elsif
        @alternate_definition
      return self.alternate_definition.replace(redefined)
    end
  end

  def self.clear
    @@study_terms = {}
  end

  def self.find(new_word)
     @@study_terms[new_word]
  end

  def delete
    @@study_terms.delete(self.new_word)
  end
end
