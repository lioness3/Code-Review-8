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
end
  # describe('create a song path', {:type => :feature}) do
  # it('creates an album and then goes to the album page') do
  #   album = Album.new("Yellow Submarine", nil, "1960", "Oldies", "Beatles")
  #   album.save
  #   visit("/albums/#{album.id}")
  #   fill_in('song_name', :with => 'All You Need Is Love')
  #   click_on('Add song')
  #   expect(page).to have_content('All You Need Is Love')
  # end
