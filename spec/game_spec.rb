require 'game' 
require 'board'

describe Game do

  EMPTY_BOARD = Board.empty_board

  let(:game) {Game.new}

  context 'new game' do
    it 'has an empty board' do
      expect(game.board.empty?).to be true
    end
  end

  context 'playing a game' do
    it 'first player marks board' do
      game.mark_board
      expect(game.board.empty?).to be false
    end
  end
end
