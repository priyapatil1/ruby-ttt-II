require 'board' 
describe Board do 

  EMPTY_BOARD = Board.with_moves(["-", "-", "-",
                                  "-", "-", "-",
                                  "-", "-", "-"])

  context 'empty board' do
    it 'creates empty board' do
      expect(Board.empty_board.equals?(EMPTY_BOARD)).to be true
    end

    it 'determines if a board is empty' do 
      expect(EMPTY_BOARD.empty?).to eq true
    end

    it 'determines if a board is not empty' do
      full_board = Board.with_moves(["X", "O", "X",
                                     "X", "O", "O",
                                     "O", "X", "X"])
      expect(full_board.empty?).to eq false 
    end

    it 'determines if a board is full' do 
      full_board = Board.with_moves(["X", "O", "X",
                                     "X", "O", "O",
                                     "O", "X", "X"])
      expect(full_board.full?).to eq true 
    end

    it 'determines if a board is not full' do 
      expect(EMPTY_BOARD.full?).to eq false 
    end
  end

  context 'row wins' do
    it 'determines a first row win for X' do
      x_first_row_win = Board.with_moves(["X", "X", "X",
                                          "X", "O", "O",
                                          "O", "X", "O"])
      expect(x_first_row_win.win_for?("X")).to eq true 
    end

    it 'determines no win for O when X wins' do
      x_first_row_win = Board.with_moves(["X", "X", "X",
                                          "X", "O", "O",
                                          "O", "X", "O"])
      expect(x_first_row_win.win_for?("O")).to eq false 
    end

    it 'determines a first row win for O' do
      o_first_row_win = Board.with_moves(["O", "O", "O",
                                          "O", "X", "X",
                                          "X", "O", "X"])

      expect(o_first_row_win.win_for?("O")).to eq true 
    end

    it 'determines no win for X when O wins' do
      o_first_row_win = Board.with_moves(["O", "O", "O",
                                          "O", "X", "X",
                                          "X", "O", "X"])

      expect(o_first_row_win.win_for?("X")).to eq false 
    end

    it 'determines a second row win for X' do
      x_second_row_win = Board.with_moves(["X", "O", "O",
                                           "X", "X", "X",
                                           "O", "X", "O"])
      expect(x_second_row_win.win_for?("X")).to eq true 
    end

    it 'determines a second row win for O' do
      o_second_row_win = Board.with_moves(["O", "X", "X",
                                           "O", "O", "O",
                                           "X", "O", "X"])
      expect(o_second_row_win.win_for?("O")).to eq true 
    end

    it 'determines a third row win for X' do
      x_third_row_win= Board.with_moves(["X", "O", "O",
                                         "O", "O", "X",
                                         "X", "X", "X"])
      expect(x_third_row_win.win_for?("X")).to eq true 
    end

    it 'determines a third row win for O' do
      o_third_row_win = Board.with_moves(["O", "X", "X",
                                          "X", "X", "O",
                                          "O", "O", "O"])
      expect(o_third_row_win.win_for?("O")).to eq true 
    end
  end

  context 'column wins' do 
    it 'can determine a first column win for X' do
      x_first_column_win = Board.with_moves(["X", "O", "X",
                                             "X", "O", "O",
                                             "X", "X", "O"])
      expect(x_first_column_win.win_for?("X")).to eq true 
    end

    it 'can determine a first column win for O' do
      o_first_column_win = Board.with_moves(["O", "X", "O",
                                             "O", "X", "X",
                                             "O", "O", "X"])
      expect(o_first_column_win.win_for?("O")).to eq true 
    end

    it 'can determine a second column win for X' do
      x_second_column_win = Board.with_moves(["O", "X", "X",
                                              "-", "X", "O",
                                              "-", "X", "O"])
      expect(x_second_column_win.win_for?("X")).to eq true 
    end

    it 'can determine a third column win for X' do
      x_third_column_win = Board.with_moves(["O", "X", "X",
                                             "-", "O", "X",
                                             "-", "O", "X"])
      expect(x_third_column_win.win_for?("X")).to eq true 
    end
  end

end
