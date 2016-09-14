require 'board'
require 'unbeatable_player'

describe UnbeatablePlayer do

  it 'plays the winning move given two options' do
    board = Board.with_moves(["X", "X", "X",
                              "X", "O",  "O",
                               7,   8,  "O"])
    unbeatable_player = UnbeatablePlayer.new
    expect(unbeatable_player.move(board)).to eq 7
  end

end
