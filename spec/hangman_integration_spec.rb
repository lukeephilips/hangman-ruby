require('capybara/rspec')
require('./app')
require('hangman')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
