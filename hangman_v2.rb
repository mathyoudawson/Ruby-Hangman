#!/usr/bin/env ruby

class Game

   def initialize(lives)
      @lives = lives
      @instance_view = View.new
      @instance_view.initialize_display(@lives)
      @instance_word = Word.new
      game_condition("active")
      @guess_array = @instance_word.generate_guess_array(select_word.size)
      puts @guess_array
   end

   def select_word
      @target_word = @instance_word.generate_random_word
   end

   def get_input
      @user_input = @instance_view.get_input
   end

   def validate_user_input(input)
      #if input.match?(/^[a-z]$/)
         #input.size > 1 || input.size < 0
         puts input
         puts "Please enter a single character" unless input.match?(/^[a-z]$/)
      #end
   end

   def game_condition(status_update)
      @game_status = status_update
   end


      def play_game
         while @game_status == "active"
            get_input
            #puts @user_input
            validate_user_input(@user_input)
         end
      end
end

class Word

   def generate_random_word
      ["aardvark", "laptop", "badger", "elephant", "populate", "tomato", "potato"].sample
   end

   def generate_guess_array(select_word_size)
      guess_array = []
      loop do
        if select_word_size == 0
          break
        end
        guess_array.push("_")
        select_word_size -= 1
      end
      guess_array
   end
end

class View

   def initialize_display(initial_lives)
      puts "Welcome to hangman"
      puts "You start with #{initial_lives} lives"
   end

   def display_lives(lives)
      puts "You have #{lives} left"
   end
   def get_input
      puts "Enter your guess"
      gets.chomp.downcase
   end
end




# class Game
#    CONST
#    intitiate
#    def
#    def validations; end
#    def input_options; end # TODO: TerminalPrompt and stuff
#    def user_input; end
# end

game_instance = Game.new(5)
game_instance.play_game
# player = Start.new(game_instance)
#
# game_instance.welcome
# game_instance.start
#
# #instance.select_word
