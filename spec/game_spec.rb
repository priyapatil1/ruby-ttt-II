require 'game'
require 'console'
require 'player'

describe Game do
  let(:output) {StringIO.new("")}
  let(:input) {StringIO.new("")}

  it 'calculates current player' do
    console = Console.new(input, output)
    player_x = Player.new("X", console)
    player_o = Player.new("O", console)
    game = Game.new(console, player_x, player_o)
    expect(game.current_player.mark).to eq "X"
  end

  context 'determines game state' do

    it 'game not over' do
      game = setup_game("1\n2\n")
      play_rounds(2, game)
      expect(game.over?).to be false
    end

    it 'game over when won' do
      game = setup_game("1\n2\n3\n4\n5\n6\n7\n")
      play_rounds(7, game)
      expect(game.over?).to be true
    end

    it 'game over when drawn' do
      game = setup_game("1\n2\n3\n5\n4\n6\n8\n7\n9")
      play_rounds(9, game)
      expect(game.over?).to be true
    end
  end


  private

  def setup_game(moves)
    input = StringIO.new(moves)
    console = Console.new(input, output)
    player_x = Player.new("X", console)
    player_o = Player.new("O", console)
    game = Game.new(console, player_x, player_o)
  end

  def play_rounds(number_of_rounds, game)
    number_of_rounds.times do |position|
      game.mark_position
    end
  end

end
