class Game

   def play_game
   end

   def initialize(lives)
      @lives = lives
      @instance_view = View.new
      @instance_view.initialize_display(@lives)
   end

   def select_word
      @target_word = Word.generate_random_word
   end

   def get_input
      @user_input = View.get_input
   end

   def validate_user_input(input)
      #rules here
   end

   def get_and_validate_user_input
      #validate_user_input(get_input)
   end

   def has_won?
      @game_status == false
      @game_status
   end

   def play_game
      View.display_initial_lives(INITIAL_LIVES)
      #while
   end
end

class Word
   def self.generate_random_word
      ["aardvark", "laptop", "badger", "elephant", "populate", "tomato", "potato"].sample
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

class TerminalPrompt
   def terminal_options; end
   def terminal_help; end
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
# player = Start.new(game_instance)
#
# game_instance.welcome
# game_instance.start
#
# #instance.select_word
