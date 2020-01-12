require "capybara/rspec"
require "./app"
require "pry"
require 'sinatra'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    click_link('Define a new word!')
    fill_in('name_input', :with => 'Momalogue')
    fill_in('definition_input', :with => 'When a mother endlessly talks about her day.')
    click_button('Create word')
    expect(page).to have_content('e')
  end
end

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    word = Word.new('Test', nil)
    word.save
    visit '/'
    click_link('Test')
    click_link('Add a Definition')
    fill_in('new_definition_input', :with => 'Something clever')
    click_button('Add a Definition!')
    expect(page).to have_content('Something clever')
  end
end
