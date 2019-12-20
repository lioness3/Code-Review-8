require('pry')
class Word
  attr_accessor :new_word
  @@words = []
  @study_terms = {}


  def initialize(new_word)
    @new_word = new_word
  end

  def add_word
    @@words.push(@new_word)
  end

  def define(word)
    word.each do |word, definition|
      @study_terms[word] = definition
  end
 end
end
