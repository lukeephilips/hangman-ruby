@@games = []
@@game = nil

class Game
  define_method(:initialize) do
    @user_guess = ''
    @guesses = 0
    @wrong_guesses = 0
    @game_over = false

    @word = set_word
    @hidden = hide_word
    @wrong_letters = []
  end
  define_singleton_method(:all) do
    @@games
  end
  define_singleton_method(:active) do
    @@game
  end
  define_method(:save) do
    @@games.push(self)
    @@game = self
  end
  define_singleton_method(:clear) do
    @@games = []
  end
  define_method(:user_guess) do
    @user_guess
  end
  define_method(:word) do
    @word
  end
  define_method(:hidden) do
    @hidden
  end
  define_method(:wrong_guesses) do
    @wrong_guesses
  end
  define_method(:wrong_letters) do
    @wrong_letters
  end
  define_method(:game_over) do
    @game_over
  end
  define_method(:hide_word) do
    @hidden = []
    @word.length.times do
      @hidden.push('-')
    end
    @hidden
  end
  define_method(:set_word) do
    words = ['chicken','turbulence','house','dog']
    # word = words.sample()

    @word = words[0].split('')
  end
  define_method(:guess) do |letter_guessed|
    if @game_over == false
      correct_guess = false
      temp_hidden = @hidden
      @word.each.with_index do |letter, index|
        if letter == letter_guessed
          correct_guess = true
          @hidden[index] = letter_guessed
        end
      end
      if correct_guess.eql?(false)
        # binding.pry
        @wrong_guesses += 1
        @wrong_letters.push(letter_guessed)
        self.is_game_over()
        @hidden
      else
        @guesses += 1
        @hidden
      end
    else
       "The Game is over. You already lost."
    end
  end
  define_method(:is_game_over) do
    if @wrong_guesses >= 6
      @game_over = true
      puts("Game Over")
    end
  end
end
