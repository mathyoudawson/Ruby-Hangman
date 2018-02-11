#!/usr/bin/env ruby

class Game

  def initialize_display(initial_lives) #Following initialization outputs these messages
     puts "Welcome to hangman"
     puts "You start with #{initial_lives} lives"
  end

  def display_lives(lives) #outputs how many lives the user has left
     puts "You have #{lives} left"
  end

  def get_input #Asks user for input and returns/assigns user_input instance variable
     puts "Enter your guess"
      @user_input = gets.chomp.downcase
  end

  def initialize(lives) #Initiral method called new Game is created
      @lives = lives
      initialize_display(@lives)
      game_condition("active")
      @guess_array = generate_guess_array(select_word.size)
  end

  def select_word
      @target_word = generate_random_word
  end

  def validate_user_input(input)
      puts input
      puts "Please enter a single character" unless input.match?(/^[a-z]$/)
  end

  def game_condition(status_update)
      @game_status = status_update
  end

  def process_correct_guess(input)
  end

  def process_incorrect_guess(input)
  end

  def check_user_input(input) #takes users input and checks wether it is included in target_word
    if @target_word.include?(input)
      process_correct_guess(input)
    else
      process_incorrect_guess(input)
    end
  end

  def check_lives
    if(@lives < 1)
      game_condition("lose")
    end
  end

  def play_game
    while @game_status == "active"
      get_input
      validate_user_input(@user_input)
      check_user_input(@user_input)
      check_lives
    end
  end

  def generate_random_word
      ["aardvark", "laptop", "badger", "elephant", "populate", "tomato", "potato"].sample
  end

   def generate_guess_array(select_word_size)
     guess_array = []
      while select_word_size > 0
        guess_array.push("_")
        select_word_size -= 1
      end
      guess_array
   end
end

game_instance = Game.new(5)
game_instance.play_game
