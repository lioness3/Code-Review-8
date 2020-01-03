require 'rspec'
require 'word'
require 'definition'

describe('#Definition') do
  before(:each)do
  Definition.clear()
  end

  it ('saves a word and definiton') do
    test = Definition.new("Compliment", "a polite expression of praise or admiration")
    expect(test.save()).to(eq(test))
 end
 it("deletes a definition") do
   defined = Definition.new("Giant Steps", "Big leap")
   defined.save()
   defined2 = Definition.new("Blue", "a wonderful color")
   defined2.save()
   defined.delete()
   expect(Definition.all).to(eq([defined2]))
 end
  it ('saves all words and definitons') do
    test = Definition.new("Compliment", "a polite expression of praise or admiration")
    test.save()
    test2 = Definition.new("Smores", "graham cracker desert")
    test2.save()
    test3 = Definition.new("Unicorn", "mythical creature")
    test3.save()
    expect(Definition.all).to(eq([test, test2, test3]))
 end
end
