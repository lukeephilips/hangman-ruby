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
end
