#!/usr/bin/env ruby

class Game
  def user_output(event)
    case event
    when :new_game_console_output
      puts "Welcome to hangman"
      puts "You start with #{@lives} lives"
    when :display_lives
      puts "You have #{@lives} lives left"
    when :process_incorrect_guess
      puts "Incorrect guess. #{user_output(display_lives)}"
    when :invalid_input
      puts "Please enter a single character"
    when :get_input
      puts "Enter your guess"
    when :process_correct_guess
      puts @guess_array.join
    when :check_win
      puts "Gamover, you won with #{@lives} lives left"
    when :check_lose
      puts "Gameover, you lost!"
    when :process_duplicate_guess
      puts "Duplicate guess. #{user_output(display_lives)}"
    when :process_duplicate_guess
      puts "Your guesses: #{@input_array.join}"
    else
      puts "Invalid output: #{event}"
    end
  end

  def initialize(lives = 4, game_condition = 'active') #Initial method called new Game is created
    @lives = lives
    @game_status = game_condition #game_condition("active")
    @target_word = generate_random_word
    @guess_array = generate_guess_array
    @input_array = []
  end

  def generate_guess_array
    @target_word.gsub(/./, "_").split("")
  end

  def new_game_console_output
     user_output(__method__)
  end

  def display_lives #outputs how many lives the user has left
     user_output(__method__)
  end

  def check_win
    if(@guess_array.join == @target_word) #win condition
      user_output(__method__)
    end
  end

  def process_correct_guess
    #refactor. look at map/dash documentation on array/hash and look at the guess array concept after that
     char_instances = (0 ... @target_word.length).find_all { |i| @target_word[i,1] == @user_input } #finds all instances of a character in the target word and populates guess array
     char_instances.each do |index|
       @guess_array[index] = @user_input
     end
     user_output(__method__)
     check_win
  end

  def check_lose
    if(@lives < 1) #lose condition
      user_output(__method__)
    end
  end

  def process_incorrect_guess
     @lives -= 1
     user_output(__method__)
     check_lose
  end

  def generate_random_word
    #method.sample
      ["aardvark", "laptop", "badger", "elephant", "populate", "tomato", "potato"].sample
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

   def process_duplicate_guess
     @lives -=1
     user_output(__method__)
     check_lose
   end

   def check_user_input(input) #takes users input and checks wether it is included in target_word
     if @input_array.include?(input)
       process_duplicate_guess
     elsif !@target_word.include?(input)
       @input_array.push(input)
       process_incorrect_guess
     else
       @input_array.push(input)
       process_correct_guess
     end

   end

   def invalid_input
     user_output(__method__)
     get_input
   end

   def validate_user_input
     # what if the user has typed in the same inout twice
       invalid_input unless @user_input.match?(/^[a-z]$/)
   end

   def get_input #Asks user for input and returns/assigns user_input instance variable
     user_output(__method__)
     @user_input = gets.chomp.downcase
     validate_user_input
   end

   def play_game
     new_game_console_output
     while @game_status == "active"
      get_input #sets @user_input as what user enters in console
       #ensure guess is a single character and prompts user to enter guess again if guess is illegal
      check_user_input(@user_input) #compares legal input to word that is being guessed
      check_condition #checks that game condition is still active
     end
   end
end

game_instance = Game.new(5)
game_instance.play_game
