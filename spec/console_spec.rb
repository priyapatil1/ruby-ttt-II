require 'console'
require 'game'
require 'board'

describe Console do 
  EMPTY_BOARD = Board.empty_board
  
  context 'display' do 
    it 'displays an empty board' do
      game = Game.new(EMPTY_BOARD)
      console = Console.new(game)
      expect(console.format_board_display).to eq "\n -----------\n"  +
                                                   "| 1 | 2 | 3 | \n" + 
                                                   " -----------\n" +
                                                   "| 4 | 5 | 6 | \n" +
                                                   " -----------\n"  +
                                                   "| 7 | 8 | 9 | \n" +
                                                   " -----------\n"  
    end
  end
end
