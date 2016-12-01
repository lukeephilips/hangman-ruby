class Game
  define_method(:initialize) do
    @guesses = 0
    @word = set_word().split('')
    @wrong_counter = 0
    @wrong_letters = []
    @game_over = false
  end
  define_method(:word) do
    @word
  end
  define_method(:wrong_counter) do
    @wrong_counter
  end
  define_method(:wrong_letters) do
    @wrong_letters
  end
  define_method(:game_over) do
    @game_over
  end
  define_method(:hide) do
    @hidden = []
    @word.length.times do
      @hidden.push('-')
    end
    @hidden
  end
  define_method(:set_word) do
    words = ['chicken','turbulence','house','dog']
    # word = words.sample()
    word = words[0]
  end
  define_method(:guess) do |letter_guessed|
    temp_hidden = @hidden
    @word.each.with_index do |letter, index|
      if letter == letter_guessed
        @hidden[index] = letter_guessed
      end
    end
    if temp_hidden == @hidden
      @wrong_counter += 1
      @wrong_letters.push(letter_guessed)
      self.is_game_over()
    end
    @guesses += 1
    @hidden
  end
  define_method(:is_game_over) do
    if wrong_counter >= 6
      @game_over = true
    end
  end
end
