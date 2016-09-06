require 'board'

describe Board do 

  context 'determines board state' do
    it 'has an empty board' do
      board = Board.new([1, 2, 3,
                         4, 5, 6,
                         7, 8, 9])
      expect(board.empty?).to be true
    end

    it 'creates an empty board' do
      empty_board = Board.empty_board
      expect(empty_board.empty?).to be true
    end
  end

  context 'marks board' do
    it 'marks a symbol on the board' do
      board = Board.empty_board
      board.mark("X", 1)
      expect(board.empty?).to be false
    end
  end
end
