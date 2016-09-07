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

    it 'displays board after one move made' do
      display = create_console_display("1\n")
      display.play_one_round
      expect(output.string).to include"\n -------------\n"  +
                                      " | X | 2 | 3 | \n" +
                                      " -------------\n" +
                                      " | 4 | 5 | 6 | \n" +
                                      " -------------\n"  +
                                      " | 7 | 8 | 9 | \n" +
                                      " -------------\n"
    end

    it 'displays greeting and plays first round' do
      display = create_console_display("1\n2\n3\n4\n5\n\n6\n7")
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

    it 'plays second round' do
      display = create_console_display("1\n2\n")
      display.play_one_round
      display.play_next_round
      expect(output.string).to include"\n -------------\n"  +
                                      " | X | O | 3 | \n" +
                                      " -------------\n" +
                                      " | 4 | 5 | 6 | \n" +
                                      " -------------\n"  +
                                      " | 7 | 8 | 9 | \n" +
                                      " -------------\n"


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
