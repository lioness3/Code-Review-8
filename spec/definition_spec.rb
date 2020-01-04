require 'rspec'
require 'word'
require 'definition'

describe('#Definition') do
  before(:each)do
  Definition.clear()
  end
  it ('saves a word and definiton') do
    test = Definition.new("Compliment", "a polite expression of praise or admiration", nil)
    expect(test.save()).to(eq(test))
  end
  # it("deletes a definition") do
  #   defined = Definition.new("Giant Steps", "Big leap", nil)
  #   defined.save()
  #   defined2 = Definition.new("Blue", "a wonderful color", nil)
  #   defined2.save()
  #   defined.delete()
  #   expect(Definition.all).to(eq([defined2]))
  # end
  it ('saves all words and definitons') do
    test = Definition.new("Compliment", "a polite expression of praise or admiration", nil)
    test.save()
    test2 = Definition.new("Smores", "graham cracker desert", nil)
    test2.save()
    test3 = Definition.new("Unicorn", "mythical creature", nil)
    test3.save()
    expect(Definition.all).to(eq([test, test2, test3]))
  end
  it('adds more than one definition') do
    test = Definition.new("Compliment", "a polite expression of praise or admiration", nil)
    test.save()
    test2 = Definition.new("Smores", "graham cracker desert", nil)
    test2.save()
    test3 = Definition.new("Unicorn", "mythical creature", nil)
    test3.save()
    test.add_definition("an exchange of words")
    test.save()
    expect(test.alternate_definition).to(eq("an exchange of words" ))
  end
  it ('deletes a definition') do
    test = Definition.new("Rope", "tightly spiraled twine", "another word for convince")
    test.save()
    test2 = Definition.new("Ring", "jewlery worn on the finger", "to call someone")
    test2.save()
    test2.delete_one("jewlery worn on the finger")
    test2.save()
      expect(test2.new_definition).to(eq(nil))
end
end
