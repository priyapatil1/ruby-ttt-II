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
      expect(player_x.current_move(1)).to eq 1
    end
  end

end
