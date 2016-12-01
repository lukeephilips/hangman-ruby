require('rspec')
require('hangman')

describe('Game') do
  it('#set_word') do
    new_game = Game.new()
    expect(new_game.word).to(eq(['c','h','i','c','k','e','n']))
  end
  it('#hide_word') do
    new_game = Game.new()
    expect(new_game.hide).to(eq(['-','-','-','-','-','-','-']))
  end
  it('#guess') do
    new_game = Game.new()
    new_game.hide()
    expect(new_game.guess("c")).to(eq(['c','-','-','c','-','-','-']))
  end
  describe('it guesses incorrectly') do
    it('#guess') do
      new_game = Game.new()
      new_game.hide()
      expect(new_game.guess("d")).to(eq(['-','-','-','-','-','-','-']))
      expect(new_game.wrong_letters).to(eq(["d"]))
      expect(new_game.wrong_counter).to(eq(1))
    end
  end
  describe('it guesses incorrectly enough times to lose -6 ') do
    it('#guess') do
      new_game = Game.new()
      new_game.hide()
      new_game.guess('r')
      new_game.guess('l')
      new_game.guess('f')
      new_game.guess('q')
      new_game.guess('w')
      new_game.guess('z')
      expect(new_game.wrong_letters).to(eq(["r",'l','f','q','w','z']))
      expect(new_game.wrong_counter).to(eq(6))
      expect(new_game.game_over).to(eq(true))
    end
  end
  describe('it guesses incorrectly 1 time too many') do
    it('#guess') do
      new_game = Game.new()
      new_game.hide()
      new_game.guess('r')
      new_game.guess('l')
      new_game.guess('f')
      new_game.guess('q')
      new_game.guess('w')
      new_game.guess('z')
      expect(new_game.guess('m')).to(eq('The Game is over. You lost.'))
    end
  end
end
