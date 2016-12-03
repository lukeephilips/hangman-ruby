@@games = []
@@game = nil

class Game
  define_method(:initialize) do
    @user_guess = ''
    @message = ''
    @guesses = 0
    @wrong_guesses = 0
    @game_state= :in_process

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
  define_method(:game_state) do
    @game_state
  end
  define_method(:message) do
    @message
  end
  define_method(:hide_word) do
    @hidden = []
    @word.length.times do
      @hidden.push('-')
    end
    @hidden
  end
  define_method(:set_word) do
    words = ['chicken','turbulence','house','dog','mango','fashion','epicenter','magnificence','tree',]
    word = words.sample()

    @word = words.sample.split('')
  end
  define_method(:guess) do |letter_guessed|
    if @game_state == :in_process
      if wrong_letters.include?(letter_guessed)
        @message = "You already guessed " + letter_guessed
      else
        @guesses += 1
        correct_guess = false
        @word.each.with_index do |letter, index|
          if letter == letter_guessed
            correct_guess = true
            @hidden[index] = letter_guessed
          end
        end
        if correct_guess.eql?(false)
          @wrong_guesses += 1
          @wrong_letters.push(letter_guessed)
          @guesses += 1
        end
      end
    end
    is_game_over?
    case game_state
    when :win
      @message = 'You win!'
    when :game_over
      @message = "Game over"
    else
      @hidden
    end
  end

  define_method(:is_game_over?) do
    if @wrong_guesses >= 6
      @game_state = :game_over
      @message = "Game Over"
    elsif !@hidden.include?('-')
      @game_state = :win
      @message = 'You win!'
    end
  end
#   define_method(:body_parts) do |wrong_guesses|
#     body_parts = {0 =>
# "_________ <br />
# |"+"&nbsp"+"|<br />
# |       |<br />
# |<br />
# |<br />
# |<br />
# |<br />
# |<br />
# -----------------", 1 => 'O', 2 => "O"+"\n"+"|"}
#   body_parts[wrong_guesses]
#   end
end
