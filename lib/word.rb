require('pry')
# first_name = ARGV[0]
# last_name = ARGV[1]
# age = ARGV[2]
# puts "This is ARGV, the arguments array: #{ARGV}."
# puts "Hello #{first_name} #{last_name}. You are #{age} years old!"
class Word
  attr_accessor :new_word, :new_definition, :study_terms
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

  def edit(new_definition)
    self.new_definition.replace @new_definition
    @@study_terms[self.new_word] = Word.new(self.new_word, self.new_definition)
  end
end
