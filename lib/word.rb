require('pry')
class Word
  attr_accessor :new_word, :id
  @@study_terms = {}

  def initialize(attributes)
    @new_word = attributes.fetch(:new_word)
    @id = attributes.fetch(:id)

  end

  def save
    @@study_terms[self.id] = Word.new({ :new_word => self.new_word, :id => self.id })
  end

  def self.all
    @@study_terms.values()
  end

  def ==(word_to_compare)
    self.new_word == word_to_compare.new_word()
  end

  def add_definition
    Definition.find_by_word_id(self.id)
  end

  def edit(new_word)
  self.new_word = new_word
  @@study_terms[self.id] = Word.new({ :new_word => self.new_word, :id => self.id })
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
