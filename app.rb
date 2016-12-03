require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/hangman')
require('pry-nav')

get '/' do
  @game = Game.new()
  @game.save()
  @hidden = @game.hidden
  erb(:index)
end

post '/' do
  @game = Game.active
  @user_guess = params.fetch('guess').downcase
  @game.guess(@user_guess)
  erb(:index)
end
