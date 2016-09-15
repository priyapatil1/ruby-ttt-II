require 'board'
require 'unbeatable_player'

describe UnbeatablePlayer do

  context 'has mark' do

    it 'has an X mark' do
      player = UnbeatablePlayer.new("X")
      expect(player.mark).to eq "X"
    end

    it 'has an O mark' do
      player = UnbeatablePlayer.new("O")
      expect(player.mark).to eq "O"
    end

  end

  context 'winning move opportunity' do

    it 'win on last row' do
      unbeatable_player = UnbeatablePlayer.new("O")
      board = Board.with_moves(["O", "X", "O",
                                "O", "X", "X",
                                 7,   8,  "X"])
      expect(unbeatable_player.move(board)).to eq 7
    end

    it 'win on middle row' do
      unbeatable_player = UnbeatablePlayer.new("O")
      board = Board.with_moves(["O", "X", 3,
                                "O",  5, "X",
                                "X", "X", "O"])
      expect(unbeatable_player.move(board)).to eq 5
    end

    it 'win on first row' do
      unbeatable_player = UnbeatablePlayer.new("O")
      board = Board.with_moves(["O", "O", 3,
                                "X", "X", 6,
                                "X", "X","O"])
      expect(unbeatable_player.move(board)).to eq 3
    end

  end

end
