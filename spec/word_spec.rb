require 'rspec'
require 'word'

describe('#Word') do
  it ('takes in a user input') do
    test = Word.new("Compliment")
    expect(test.add_word).to(eq(["Compliment"]))
 end
end
 describe('.define') do
 it ('lets user define word') do
   test = Word.new("Compliment")
   test.add_word
   expect(test.define("Nice gesture")).to(eq("Nice gesture"))
end
end
