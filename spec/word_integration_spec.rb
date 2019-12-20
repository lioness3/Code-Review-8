require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word path', {:type => :feature}) do
  it('creates a new word and goes to display page') do
    visit('/home')
    if has_field?('new_word')
    fill_in('new_word', :with => 'Compliment')
  save_and_open_page
    click_on('ADD')
    expect(page).to have_content('Compliment')
  end
  end
end
