require 'rspec'
require 'word'

describe('#Word') do
  it ('takes in a user input') do
    test = Word.new("Compliment")
    expect(test.add_word).to(eq(["Compliment"]))
 end
end
