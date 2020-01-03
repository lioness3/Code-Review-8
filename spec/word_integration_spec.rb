require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the home page') do
    visit('/home')
    save_and_open_page
    fill_in("new_word", :with => 'Salami')
    fill_in('new_definition', :with => 'food product')
    click_on('ADD')
    expect(page).to have_content('Salami : food product')
  end
  it('edits a definition') do
    word = Definition.new("Tear", "product of crying", nil)
    word.save
    visit("/home/edit")
    fill_in('alternate_definition', :with => 'ripping of an object, usually paper')
    click_on('ADD THIS TOO')
    expect(page).to have_content("Tear product of crying: ripping of an object, usually paper" )
  end
end
