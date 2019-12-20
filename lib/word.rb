class Word
  attr_accessor :word1, :word2, :word3, :word4, :word5
  @@words = {}


  def initialize(word1, word2, word3, word4, word5)
    @word1 = word1
    @word2 = word2
    @word3 = word3
    @word4 = word4
    @word5 = word5
  end

  def new_word
    @@words = @words.push(@word1)
  end
