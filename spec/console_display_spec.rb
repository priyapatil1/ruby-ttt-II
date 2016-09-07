require 'console_display'
require 'console'
require 'game'

describe ConsoleDisplay do
  let(:input) {StringIO.new("1\n")}
  let(:output) {StringIO.new("")}

  context 'display' do 

    it 'formats an empty board' do
      display = create_console_display
      expect(display.format_board).to eq "\n -------------\n"  +
                                         " | 1 | 2 | 3 | \n" +
                                         " -------------\n" +
                                         " | 4 | 5 | 6 | \n" +
                                         " -------------\n"  +
                                         " | 7 | 8 | 9 | \n" +
                                         " -------------\n"
    end

    it 'displays an initial greeting and an empty board' do
      display = create_console_display
      display.show_start_screen
      expect(output.string).to eq "\nWelcome to Tic Tac Toe!" +
                                  "\nPlease choose a position from 1 - 9\n" +
                                  "\n -------------\n"  +
                                  " | 1 | 2 | 3 | \n" +
                                  " -------------\n" +
                                  " | 4 | 5 | 6 | \n" +
                                  " -------------\n"  +
                                  " | 7 | 8 | 9 | \n" +
                                  " -------------\n"

    end
  end

  private

  def create_console_display
      console = Console.new(input, output)
      game = Game.new(console)
      display = ConsoleDisplay.new(game, console)
  end

end
