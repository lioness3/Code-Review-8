require('pry')
class Word
  attr_accessor :new_word, :new_definition, :study_terms
  @@study_terms = {}


  def initialize(new_word, new_defintion)
    @new_word = new_word
    @new_defintion = new_defintion
  end

  def save
    @@study_terms[@new_word] = Word.new(@new_word, @new_defintion)
 end

end
