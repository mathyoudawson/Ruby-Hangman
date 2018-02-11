#!/usr/bin/env ruby

class Game

  def initialize_display(initial_lives) #Following initialization outputs these messages
     puts "Welcome to hangman"
     puts "You start with #{initial_lives} lives"
  end

  def display_lives(lives) #outputs how many lives the user has left
     "You have #{lives} lives left"
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



  def process_correct_guess(input)
     char_instances = (0 ... @target_word.length).find_all { |i| @target_word[i,1] == input }
     char_instances.each do |index|
      @guess_array[index] = input
     end
     puts @guess_array.join
  end

  def process_incorrect_guess(input)
     @lives -= 1
     puts "Incorrect guess. #{display_lives(@lives)}"
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

   def game_condition(status_update)
       @game_status = status_update
   end

   def check_condition
     if(@lives < 1) #lose condition
       game_condition("lose")
     end
     if(@guess_array.join == @target_word) #win condition
       game_condition("win")
     end
   end

   def check_user_input(input) #takes users input and checks wether it is included in target_word
     if @target_word.include?(input)
       process_correct_guess(input)
     else
       process_incorrect_guess(input)
     end
   end

   def validate_user_input(input)
       puts "Please enter a single character" unless input.match?(/^[a-z]$/)
   end

   def get_input #Asks user for input and returns/assigns user_input instance variable
     puts "Enter your guess"
     @user_input = gets.chomp.downcase
   end

   def play_game
     while @game_status == "active"
      get_input #sets @user_input as what user enters in console
      validate_user_input(@user_input) #ensure guess is a single character and prompts user to enter guess again if guess is illegal
      check_user_input(@user_input) #compares legal input to word that is being guessed
      check_condition #checks that game condition is still active
     end
     puts "GAMEOVER. You #{@game_status}"
   end
end

game_instance = Game.new(5)
game_instance.play_game
