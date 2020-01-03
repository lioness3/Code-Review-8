require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the home page') do
    visit('/home')

    fill_in('new_word', :with => 'Salami')
    fill_in('new_definition', :with => 'food product')
    click_on('ADD')
    save_and_open_page
    expect(page).to have_content('Salami : food product')
  end
  # it('edits a definition') do
  #   word = Word.new("Violin", "musical instruemnt")
  #   word.save
  #   visit("/home/edit")
  #   fill_in('', :with => 'All You Need Is Love')
  #   click_on('')
  #   expect(page).to have_content('All You Need Is Love')
  # end
end
