require 'game'
require 'console_display'

class Console

  def initialize(output)
    @output = output
    game = Game.new
    @console_display = ConsoleDisplay.new(game)
  end

  def start
    show_greeting
    show_empty_board
  end

  def get_input
    1
  end

  private

  def show_greeting
    @output.puts "\nWelcome to Tic Tac Toe!" +
                 "\nPlease choose a position from 1 - 9\n"
  end

  def show_empty_board
    @output.puts @console_display.format_board
  end

end
