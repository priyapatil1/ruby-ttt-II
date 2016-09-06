require 'player'

describe Player do

  it 'exposes its mark' do
    expect(Player.new("X").mark).to eq "X"
  end

  it 'exposes a different mark' do
    expect(Player.new("O").mark).to eq "O"
  end

end
