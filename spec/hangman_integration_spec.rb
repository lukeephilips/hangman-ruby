require('capybara/rspec')
require('./app')
require('hangman')
Capybara.app = Sinatra::Application
# set(:show_exceptions, false)

describe('The home path', {:type => :feature}) do
  before do
    Game.clear
    visit '/'
  end
  it('displays a blank game board') do
    expect(page).to have_content 'Hangman'
  end
  it('displays a hidden word') do
    expect(page).to have_content
    expect(page).to have_content ['-','-','-','-','-','-','-']
  end
  it('allows user to make a guess and shows users guess') do
    fill_in('guess', :with => 'w')
    click_button('Go')
    expect(page).to have_content 'w'
  end
  it('allows user to make a guess and shows updated guesses array') do
    fill_in('guess', :with => 'c')
    click_button('Go')
    expect(page).to have_content "['c','-','-','c','-','-','-']"
  end
end
