
class Word
  attr_accessor :name, :id


  @@study_terms = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@study_terms.values()
  end

  def save
    @@study_terms[self.id] = Word.new({ :name => self.name, :id => self.id })
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@study_terms = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@study_terms[id]
  end

  def update(name)

    self.name = name
    @@study_terms[self.id] = Word.new({ :name => self.name, :id => self.id })
  end

  def delete
    @@study_terms.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
end
end
