require 'board'
require 'unbeatable_player'

describe UnbeatablePlayer do
  it 'has a mark' do
    player = UnbeatablePlayer.new("X")
    expect(player.mark).to eq "X"
  end

  it 'plays the winning move given two options' do
    unbeatable_player = UnbeatablePlayer.new("X")
    board = Board.with_moves(["X", "X", "X",
                              "X", "O",  "O",
                               7,   8,  "O"])
    expect(unbeatable_player.move(board)).to eq 7
  end

end
