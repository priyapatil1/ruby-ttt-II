require 'console_display'
require 'game'
require 'board'

describe ConsoleDisplay do
  
  context 'display' do 
    it 'displays an empty board' do
      game = Game.new
      console = ConsoleDisplay.new(game)
      expect(console.format_board).to eq "\n -------------\n"  +
                                           " | 1 | 2 | 3 | \n" + 
                                           " -------------\n" +
                                           " | 4 | 5 | 6 | \n" +
                                           " -------------\n"  +
                                           " | 7 | 8 | 9 | \n" +
                                           " -------------\n"  
    end
  end
end
