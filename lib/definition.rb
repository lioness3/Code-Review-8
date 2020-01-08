require('pry')
class Definition
  attr_accessor :id, :word_id, :user_definitions

  @@definitions = {}

  def initialize(attributes)
    @id = rand(5)
    @user_definitions = attributes.fetch("user_definitions")
    @word_id = attributes.fetch("word_id")

  def self.all
    @@definitions.values
  end

  # def ==(word_to_compare)
  #   self.new_word == word_to_compare.new_word()
  # end

  def save
    @@definitions[self.new_word] = Definition.new(self.word_id, self.user_definitions)
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word_id(word_id)
    @@definitions.select { |definition| definition.word_id == word_id }
  end

  def self.clear
    @@definitions = {}
  end

  def delete
  @@definitions.delete(self.word_id)
end
end
