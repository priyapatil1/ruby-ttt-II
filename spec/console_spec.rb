require 'console'
require 'game'
require 'board'

describe Console do 
  EMPTY_BOARD = Board.empty_board
  
  context 'display' do 
    it 'displays an empty board' do
      game = Game.new(EMPTY_BOARD)
      console = Console.new(game)
      expect(console.board_display).to eq " -----------\n"  +
                                          "| 1 | 2 | 3 | \n " + 
                                          "| 4 | 5 | 6 | \n " +
                                          "| 7 | 8 | 9 | \n" +
                                          " -----------\n"  
    end
  end
end
