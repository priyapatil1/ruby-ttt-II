require 'player'

describe Player do

  context 'player mark' do

    it 'exposes mark' do
      expect(Player.new("X").mark).to eq "X"
    end

    it 'exposes a different mark' do
      expect(Player.new("O").mark).to eq "O"
    end

  end

  context 'player move' do

    it 'sets current move' do
      player_x = Player.new("X")
      expect(player_x.set_current_move(1)).to eq 1
    end

    it 'sets a different current move' do
      player_x = Player.new("X")
      expect(player_x.set_current_move(4)).to eq 4
    end

    it 'exposes current move' do
      player_x = Player.new("X")
      player_x.set_current_move(2)
      expect(player_x.current_move).to eq 2
    end

    it 'exposes another current move' do
      player_x = Player.new("X")
      player_x.set_current_move(5)
      expect(player_x.current_move).to eq 5
    end

  end

end
