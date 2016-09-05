require 'game' 
require 'board'

describe Game do
  EMPTY_BOARD = Board.empty_board

  context 'new game' do
    it 'has an empty board' do
      game = Game.new(EMPTY_BOARD)
      expect(game.board.empty?).to be true
    end
  end
end
