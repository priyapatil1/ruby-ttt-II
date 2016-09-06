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

  context 'marks an empty board' do
    let(:board) {Board.empty_board}

    it 'marks a symbol on the board' do
      board.mark("X", 1)
      expect(board.empty?).to be false
    end

    it 'marks an X at a given position' do
      board.mark("X", 1)
      expect(board.symbol_at(1)).to eq "X"
    end

    it 'marks an O at a given position' do
      board.mark("O", 2)
      expect(board.symbol_at(2)).to eq "O"
    end
  end
end
