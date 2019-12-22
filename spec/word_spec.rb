require 'rspec'
require 'word'

describe('#Word') do
  it ('saves a word and definiton') do
    test = Word.new("Compliment", "a polite expression of praise or admiration")
    expect(test.save()).to(eq("Compliment", "a polite expression of praise or admiration"))
 end
end
