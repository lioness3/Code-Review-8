require 'rspec'
require 'album'

describe('#Word') do
  it ('takes in a user input') do
    test = Word.new("Compliment","Eco-System","Merge","Philosophy","Trumpet")
    expect(test.new_word).to(eq("Compliment"))
end
end
