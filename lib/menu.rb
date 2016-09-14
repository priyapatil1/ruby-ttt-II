require 'game'
require 'game_setup'
require 'console_display'

class Menu

  attr_reader :size
  attr_reader :game

  def initialize(console, exiter)
    @console = console
    @exiter = exiter
    @game_option_titles = ["Human vs Human",
                           "Human vs Computer",
                           "Computer vs Human",
                           "Computer vs Computer",
                           "Exit"]
  end

  def create_game(option)
    game_setup = GameSetup.new(@console)
    game_setup.create_game(option)
  end

  def start
    show_initial_message
    option_chosen = @console.get_input
    play_game_till_exit(option_chosen)
    exit_ttt
  end

  def show_initial_message
    show_initial_greeting
    display_options
  end

  private

  def play_game_till_exit(option_chosen)
    while option_chosen != GameOption::EXIT
      play_game(option_chosen)
      display_options
      option_chosen = @console.get_input
      clear_screen
    end
  end

  def show_initial_greeting
    @console.show_greeting
  end

  def display_options
    @console.show_menu_options(@game_option_titles)
  end

  def play_game(option)
    game = create_game(option)
    ConsoleDisplay.new(game, @console).start
  end

  def exit_ttt
    @exiter.execute
  end

  def clear_screen
    @console.clear_screen
  end

end
