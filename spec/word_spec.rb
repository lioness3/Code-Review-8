require 'rspec'
require 'word'
require 'definition'

describe('#Word') do
  before(:each)do
  Word.clear()
  end

  it ('saves a word and definiton') do
    test = Word.new("Compliment", "a polite expression of praise or admiration")
    expect(test.save()).to(eq(test))
 end
  it ('saves all words and definitons') do
    test = Word.new("Compliment", "a polite expression of praise or admiration")
    test.save()
    test2 = Word.new("Smores", "graham cracker desert")
    test2.save()
    test3 = Word.new("Unicorn", "mythical creature")
    test3.save()
    expect(Word.all).to(eq([test, test2, test3]))
 end
 it ('edits a definiton') do
   test = Word.new("Compliment", "a polite expression of praise or admiration")
   test.save()
   test2 = Word.new("Smores", "graham cracker desert")
   test2.save()
   test3 = Word.new("Unicorn", "mythical creature")
   test3.save()
   test2.edit( "graham cracker, marshmellow, and chocolate desert")
   test2.save()
   expect(test2.new_definition).to(eq("graham cracker, marshmellow, and chocolate desert"))
end  
end
