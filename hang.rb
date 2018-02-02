#!/usr/bin/env ruby

class GuessGame
  INITIAL_LIVES = 5
  WORDS = ["aardvark", "laptop", "badger", "elephant", "populate", "tomato", "potato"]

  def initialize
  end

  def lose_life
    @lives -= 1
  end

  def set_hidden_word
    WORDS.first # TODO: make rando
  end

  def set_guess_array (length, arr) #
    puts length
    puts arr

  end

  def play_game
    @lives = INITIAL_LIVES
    @guess_array = []


    puts "u redy?"
    hidden_word = set_hidden_word #grabs my pseudo rando word
    set_guess_array(hidden_word.size, @guess_array) #set array with underscore that shares same length as word i am guessing :p

    loop do
      puts "enter a char pl0x"
      char = gets.chomp
      puts "u haff #{@lives}"

      if hidden_word.include?(char)
        puts "u win crt + c"
      #  @guess.push char
        #puts @guess
      else
        puts "u bad"
        lose_life
        if @lives < 1
          puts "srry u succ"
          break
        end
      end
    end
  end
end

instance = GuessGame.new
instance.play_game
