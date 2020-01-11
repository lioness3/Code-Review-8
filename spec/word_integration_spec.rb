require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('definition path ', {:type => :feature}) do
  it('edits definition on edit page and displays it on home page') do
    visit('/home/edit/:id')
     if page.has_field?('.edit_definition')
    fill_in('edited_definition', :with => 'SHMO')
    click_on('Save Changes')
    expect(page).to have_content('SHMO')
  end
  end
end
