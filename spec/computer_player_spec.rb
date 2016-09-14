require 'computer_player'
require 'board'

describe ComputerPlayer do

  context 'player mark' do

    it 'has an X mark' do
    computer_player = ComputerPlayer.new("X")
    expect(computer_player.mark).to eq "X"
  end

  it 'has an O mark' do
    computer_player = ComputerPlayer.new("O")
    expect(computer_player.mark).to eq "O"
  end

end

  context 'plays first available move' do
    it 'plays the next available move on empty board' do
      computer_player = ComputerPlayer.new("X")
      board = Board.empty_board
      computer_player.set_current_move(board)
      expect(computer_player.current_move).to eq 1
    end

    it 'plays the next available move' do
      computer_player = ComputerPlayer.new("O")
      board = Board.with_moves(["X", "O", "X",
                                "X",  5, "O",
                                "O", "X", "X"])
      computer_player.set_current_move(board)
      expect(computer_player.current_move).to eq 5
    end
  end
end

