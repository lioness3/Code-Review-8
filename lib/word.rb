require('pry')
class Word
  attr_accessor :new_word, :words, :study_terms, :definition
  @@words = []
  @study_terms = {}


  def initialize(new_word, definition)
    @new_word = new_word
    @definition = definition
  end

  def add_word
  @@words =  @@words.push(@new_word)
  end

  def define
    @words.each do |word, definition|
      @study_terms[word] = definition
  end
  return definition
 end
end
