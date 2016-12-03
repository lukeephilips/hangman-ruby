require('rspec')
require('hangman')

describe('Game') do
  before do
    Game.clear
  end
  it('#set_word') do
    new_game = Game.new()
    expect(new_game.word).to(eq(['c','h','i','c','k','e','n']))
  end
  it('#hide_word_word') do
    new_game = Game.new()
    expect(new_game.hide_word).to(eq(['-','-','-','-','-','-','-']))
  end
  it('#guess') do
    new_game = Game.new()
    new_game.hide_word()
    expect(new_game.guess("c")).to(eq(['c','-','-','c','-','-','-']))
  end
  describe('increments wrong guess atributes when user guesses incorrectly') do
    before do
      Game.clear
    end
    it('#guess') do
      new_game = Game.new()
      new_game.hide_word()
      expect(new_game.guess("d")).to(eq(['-','-','-','-','-','-','-']))
      expect(new_game.wrong_letters).to(eq(["d"]))
      expect(new_game.wrong_guesses).to(eq(1))
    end
  end
  describe('it guesses incorrectly enough times to lose -6 ') do
    before do
      Game.clear
    end
    it('#guess') do
      new_game = Game.new()
      new_game.hide_word()
      new_game.guess('r')
      new_game.guess('l')
      new_game.guess('f')
      new_game.guess('q')
      new_game.guess('w')
      new_game.guess('z')
      expect(new_game.wrong_letters).to(eq(["r",'l','f','q','w','z']))
      expect(new_game.wrong_guesses).to(eq(6))
      expect(new_game.game_over).to(eq(true))
    end
  end
  describe('it guesses incorrectly 1 time too many') do
    before do
      Game.clear
    end
    it('#guess') do
      new_game = Game.new()
      new_game.hide_word()
      new_game.guess('r')
      new_game.guess('l')
      new_game.guess('f')
      new_game.guess('q')
      new_game.guess('w')
      new_game.guess('z')
      expect(new_game.guess('m')).to(eq('The Game is over. You already lost.'))
    end
  end
end
