require 'board'

describe Board do 

  context 'determines board state' do
    it 'empty board' do
      board = Board.new([1, 2, 3,
                         4, 5, 6,
                         7, 8, 9])
      expect(board.empty?).to be true

    end
  end
end
