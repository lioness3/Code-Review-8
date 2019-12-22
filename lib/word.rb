require('pry')
class Word
  attr_accessor :new_word, :words, :study_terms, :definition
  @@words = []
  @@study_terms = {}


  def initialize(new_word)
    @new_word = new_word

  end

  def add_word
  @@words = @words.push(@new_word)
  end

  def define(definiton)
    @@study_terms[@new_word] = defintion
return @@study_terms[@new_word]
 end
end
