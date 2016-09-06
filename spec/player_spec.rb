require 'player'
require 'console'

describe Player do
  let(:output) {StringIO.new("")}
  let(:input) {StringIO.new("")}
  let(:console) {Console.new(input, output)}

  context 'player mark' do

    it 'exposes mark' do
      expect(Player.new("X", console).mark).to eq "X"
    end

    it 'exposes a different mark' do
      expect(Player.new("O", console).mark).to eq "O"
    end

  end

  context 'player move' do

    it 'sets current move' do
      input = StringIO.new("1/n")
      console = Console.new(input, output)
      player_x = Player.new("X",console)
      expect(player_x.set_current_move).to eq 1
    end

    it 'sets a different current move' do
      input = StringIO.new("4/n")
      console = Console.new(input, output)
      player_x = Player.new("X", console)
      expect(player_x.set_current_move).to eq 4
    end

    it 'exposes current move' do
      input = StringIO.new("2/n")
      console = Console.new(input, output)
      player_x = Player.new("X", console)
      player_x.set_current_move
      expect(player_x.current_move).to eq 2
    end

    it 'exposes another current move' do
      input = StringIO.new("5/n")
      console = Console.new(input, output)
      player_x = Player.new("X", console)
      player_x.set_current_move
      expect(player_x.current_move).to eq 5
    end

    it 'sets current move' do
      input = StringIO.new("5/n")
      console = Console.new(input, output)
      player_x = Player.new("X", console)
      player_x.set_current_move
      expect(player_x.current_move).to eq 5
    end

  end

end
