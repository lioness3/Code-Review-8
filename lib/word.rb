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

#   def self.all
#     @@albums.values()
#   end
#
#   def self.search(name)
#     @@albums.values.select |  name |
#
#     if
#       name.split(/\W/) == @name
#       return @name
#     else
#       puts "no album matches your search"
#     end
#   end
#
#   def save
#     @@albums [self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
#   end
#
#   def ==(album_to_compare)
#     self.name() == album_to_compare.name()
#   end
#
#   def self.clear
#     @@albums = {}
#     @@total_rows = 0
#   end
#
#   def self.find(id)
#     @@albums[id]
#   end
#
#   def update(name, year, genre, artist)
#     @name = name
#     @year = year
#     @genre = genre
#     @artist = artist
#   end
#
#   def delete
#     @@albums.delete(self.id)
#   end
# end
