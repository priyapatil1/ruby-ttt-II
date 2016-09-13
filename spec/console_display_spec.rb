require 'console_display'
require 'console'
require 'game'

describe ConsoleDisplay do
  let(:output) {StringIO.new("")}

  context 'display' do 

    it 'formats an empty board' do
      display = create_console_display("")
      expect(display.format_board).to eq "\n -------------\n"  +
                                         " | 1 | 2 | 3 | \n" +
                                         " -------------\n" +
                                         " | 4 | 5 | 6 | \n" +
                                         " -------------\n"  +
                                         " | 7 | 8 | 9 | \n" +
                                         " -------------\n"
    end

    it 'displays an initial greeting and an empty board' do
      display = create_console_display("")
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

    it 'displays greeting and first move' do
      display = create_console_display("1\n2\n3\n4\n5\n\n6\n7\n8\n9")
      display.start
      expect(output.string).to include"\nWelcome to Tic Tac Toe!" +
                                      "\nPlease choose a position from 1 - 9\n" +
                                      "\n -------------\n"  +
                                      " | 1 | 2 | 3 | \n" +
                                      " -------------\n" +
                                      " | 4 | 5 | 6 | \n" +
                                      " -------------\n"  +
                                      " | 7 | 8 | 9 | \n" +
                                      " -------------\n"
      expect(output.string).to include"\n -------------\n"  +
                                      " | X | 2 | 3 | \n" +
                                      " -------------\n" +
                                      " | 4 | 5 | 6 | \n" +
                                      " -------------\n"  +
                                      " | 7 | 8 | 9 | \n" +
                                      " -------------\n"
    end

    it 'displays full board' do
      display = create_console_display("1\n2\n3\n5\n4\n6\n8\n7\n9")
      display.start
      expect(output.string).to include"\n -------------\n"  +
                                      " | X | O | X | \n" +
                                      " -------------\n" +
                                      " | X | O | O | \n" +
                                      " -------------\n"  +
                                      " | O | X | X | \n" +
                                      " -------------\n"
    end

    it 'does not allow position with X to be overwritten' do
      display = create_console_display("1\n1\n2\n3\n5\n4\n6\n8\n7\n9")
      display.start
      expect(output.string).to include"\n -------------\n"  +
                                      " | X | O | X | \n" +
                                      " -------------\n" +
                                      " | X | O | O | \n" +
                                      " -------------\n"  +
                                      " | O | X | X | \n" +
                                      " -------------\n"
    end

    it 'does not allow position with O to be overwritten' do
      display = create_console_display("1\n2\n2\n3\n5\n4\n6\n8\n7\n9")
      display.start
      expect(output.string).to include"\n -------------\n"  +
                                      " | X | O | X | \n" +
                                      " -------------\n" +
                                      " | X | O | O | \n" +
                                      " -------------\n"  +
                                      " | O | X | X | \n" +
                                      " -------------\n"
    end

    it 'displays message not to overwrite marked position' do
      display = create_console_display("1\n2\n2\n3\n5\n4\n6\n8\n7\n9")
      display.start
      expect(output.string).to include "\nPlease choose an empty position\n"
    end

    it 'displays game over message when game won by X' do
      display = create_console_display("1\n2\n3\n4\n5\n6\n7\n")
      display.start
      expect(output.string).to include "Game over! X is the winner!\n"
    end

    it 'displays game over message when game won by O' do
      display = create_console_display("1\n2\n3\n5\n6\n8\n")
      display.start
      expect(output.string).to include "Game over! O is the winner!\n"
    end

    it 'displays drawn game message' do
      display = create_console_display("1\n2\n3\n4\n6\n5\n8\n9\n7\n")
      display.start
      expect(output.string).to include "Game over! It's a draw"
    end

  end

  private

  def create_console_display(move)
    input = StringIO.new(move)
    console = Console.new(input, output)
    game = Game.new(console)
    display = ConsoleDisplay.new(game, console)
  end

end
