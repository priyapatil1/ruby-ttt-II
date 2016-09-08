require 'board'

describe Board do 


  context 'determines board state' do

    it 'is an empty board' do
      board = Board.new([1, 2, 3,
                         4, 5, 6,
                         7, 8, 9])
      expect(board.empty?).to be true
    end

    it 'creates an empty board' do
      empty_board = Board.empty_board
      expect(empty_board.empty?).to be true
    end

    it 'is a full board' do
      board = Board.with_moves(["X", "O", "X",
                                "X", "O", "O",
                                "O", "X", "X"])
      expect(board.full?).to be true
    end

    it 'half marked board is not full' do
      board = Board.with_moves(["X",  2,  3,
                                "X",  5, "O",
                                "O",  8, "X"])
      expect(board.full?).to be false 
    end

    it 'calculates remaining cells for empty board' do
      empty_board = Board.empty_board
      expect(empty_board.remaining_cells).to eq 9
    end

    it 'calculates remaining cells for half marked board' do
      board = Board.with_moves(["X",  2,  3,
                                "X",  5, "O",
                                "O",  8, "X"])
      expect(board.remaining_cells).to eq 4
    end

    it 'finds empty position' do
      board = Board.with_moves(["X",  2,  3,
                                "X",  5, "O",
                                "O",  8, "X"])
      expect(board.empty_position?(2)).to eq true
    end

    it 'position with X not empty' do
      board = Board.with_moves(["X",  2,  3,
                                "X",  5, "O",
                                "O",  8, "X"])
      expect(board.empty_position?(1)).to eq false
    end

    it 'position with O not empty' do
      board = Board.with_moves(["X",  2,  3,
                                "X",  5, "O",
                                "O",  8, "X"])
      expect(board.empty_position?(7)).to eq false
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

  context 'winning lines' do
    it 'first row win for X' do
      x_first_row_win = Board.new(["X", "X", "X",
                                   "X", "O", "O",
                                   "O", "X", "O"])
      expect(x_first_row_win.win?).to eq true
    end
  end

end
