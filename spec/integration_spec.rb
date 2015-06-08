require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the to do website path', {:type => :feature}) do
  it('allows users to create lists of different tasks') do
    visit('/')
    fill_in('name', :with => 'Epicodus Stuff')
    click_button('Add')
    expect(page).to have_content('Epicodus Stuff')
  end
end
