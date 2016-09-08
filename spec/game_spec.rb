require 'game'
require 'console'

describe Game do

  it 'calculates current player' do
    input = StringIO.new("")
    output = StringIO.new("")
    console = Console.new(input, output)
    game = Game.new(console)
    expect(game.current_player.mark).to eq "X"
  end

end
