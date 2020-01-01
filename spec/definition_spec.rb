require 'rspec'
require 'word'

describe('#Definition') do
  before(:each)do
  Definition.clear()
  end

  it ('saves a word and definiton') do
    test = Definition.new("Compliment", "a polite expression of praise or admiration")
    expect(test.save()).to(eq(test))
 end
 #  it ('saves all words and definitons') do
 #    test = Definition.new("Compliment", "a polite expression of praise or admiration")
 #    test.save()
 #    test2 = Definition.new("Smores", "graham cracker desert")
 #    test2.save()
 #    test3 = Definition.new("Unicorn", "mythical creature")
 #    test3.save()
 #    expect(Definition.all).to(eq([test, test2, test3]))
 # end
end
