require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the to do website path', {:type => :feature}) do
  it('allows users to create lists of different tasks') do
    visit('/')
    fill_in('name', :with => 'Epicodus')
    click_button('Add')
    expect(page).to have_content('Epicodus')
    click_link('Epicodus')
    expect(page).to have_content("Epicodus")
  end
end
# describe('the path to a list\'s page', {:type => :feature}) do
#   it('allows user to go to the individual list page') do
#     visit('/')
#
#   end
# end
