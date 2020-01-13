require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word path ', {:type => :feature}) do
  it('creates a word and adds it to the page') do
    visit('/')
     if page.has_field?('.edit_definition')
      fill_in('name', :with => 'SHMO')
      click_on('ADD')
      expect(page).to have_content('SHMO')
    end
  end
end
describe('definition path ', {:type => :feature}) do
  it('edits definition on edit page and displays it on home page') do
    visit('/words/edit/:id')
     if page.has_field?('.edit_definition')
    fill_in('edited_definition', :with => 'SHMO')
    click_on('Save Changes')
    expect(page).to have_content('SHMO')
  end
  end
end
