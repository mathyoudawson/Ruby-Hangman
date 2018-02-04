#!/usr/bin/env ruby
require 'colorize'
class GuessGame
  INITIAL_LIVES = 5
  WORDS = ["aardvark", "laptop", "badger", "elephant", "populate", "tomato", "potato"]

  def initialize
  end

  def lose_life
    @lives -= 1
  end

  def set_hidden_word
   WORDS.sample # TODO: make rando

  end

  def convert_hidden_word(word)
    i = word.size
    loop do
      if i == 0
        break
      end
      @guess_array.push("_")
      i -= 1
    end

  end

#  def set_guess_array (length, arr) #
  #  puts length
  #  puts arr

  #end

  def play_game
    @lives = INITIAL_LIVES
    @guess_array = []
    puts "Games is intializing..."
    sleep 0.5
    puts "27%"
    sleep 0.27
    puts "66%"
    sleep 0.42
    puts "100% Game Loaded\n\n"
    hidden_word = set_hidden_word #grabs my pseudo rando word
    convert_hidden_word(hidden_word)
    #set_guess_array(hidden_word.size, @guess_array) #set array with underscore that shares same length as word i am guessing :p
    puts "You start with #{INITIAL_LIVES} lives"

    loop do
      puts "Enter a guess: \n\n"
      char = gets.chomp.downcase

      while char.size > 1 || char.size < 0 #checks that input is a single character
        puts "Please enter a single character"
        char = gets.chomp.downcase
      end

      if hidden_word.include?(char)
        index = hidden_word.index(char)
        @guess_array[index] = char
        scan_array = hidden_word.scan(char) #returns array of all occurances of char in hidden_word
        scan_counter = scan_array.size #TODO: add multiple instances of a correct guess

        puts "Correct guess: #{char}".green
        puts "Current status #{@guess_array.join("")}\n\n"
        #puts @guess
      else
        puts "Incorrect guess: #{char}".red
        lose_life
        puts "You have #{@lives} lives left\n\n"
        if @lives < 1
        puts "Bruh you dead... you only got to #{@guess_array.join("")}".red
        puts "Word was #{hidden_word} \n\n".red
        print  "  +---+-
  |   |
  |   0
  |   |\\
  |   /\\
-+----------".red
          break
        end
      end
      if @guess_array.include?("_") == false
        puts "You win!".green
        puts "Word was #{hidden_word}".green
        puts "
           (@)
           ^\\|
            |/^
        ____|_____".green
      end
    end
  end
end

instance = GuessGame.new
instance.play_game
