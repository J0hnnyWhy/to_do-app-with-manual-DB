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
    click_link('Epicodus')
    expect(page).to have_content("Epicodus")
  end
end
describe('the list page path', {:type => :feature}) do
  it('allows user to add tasks in a list') do
    visit('/')
    fill_in('name', :with => 'Epicodus')
    click_button('Add')
    click_link('Epicodus')
    fill_in('Add a Task to this List', :with => 'get out of bed')
    click_button('Add')
    expect(page).to have_content('get out of bed')
  end
end

describe('the update and delete path', {:type => :feature}) do
  it('allows user to update lists') do
    visit('/')
    fill_in('name', :with => 'Epicodus')
    click_button('Add')
    click_link('Epicodus')
    click_button("Delete List")
    expect(page).to have_content('To Do List App')
  end
end
