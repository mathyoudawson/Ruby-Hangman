class GuessGame
  attr_accessor :hidden_word, :output, :lives
  lives = 5
  Words = ["aardvark", "laptop", "badger", "elephant", "populate", "tomato", "potato"].freeze
  guesses = []

  def random_word
    hidden_word = Words[rand(Words.length-1)]
  end

  def check_guess(guess)

  end

  def start_game
    new_game = EnterGuess.new
    new_game.initialize_guess
  end

  def get_lives
    :lives
  end
end

class EnterGuess
  def initialize_guess
    puts "Enter your guess mate: "
    guess = gets.chomp

    if guess.size != 1
      bad_guess
    end

    puts "You guessed: #{guess}"
    #GuessGame.check_guess(guess)
    #puts "Current guesses: #{} Lives left: #{instance.get_lives}"
  end

  def bad_guess
    loop do
      puts "You entered #{guess} which is longer than 1 character, try again bozo"
      guess = gets.chomp
    end unless guess.size==1
  end
end

instance = GuessGame.new
instance.start_game
print instance.random_word
