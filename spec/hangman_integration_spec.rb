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
    # visit('/')
    expect(page).to have_content 'Hangman'
  end
  it('displays a hidden word') do
    # visit('/')
    expect(page).to have_content
    expect(page).to have_content ['-','-','-','-','-','-','-']
  end
  it('allows user to make a guess and shows users guess') do
    # visit('/')
    expect(page).to have_content
    fill_in('guess', :with => 'w')
    click_button('Go')
    expect(page).to have_content 'w'
  end
end
