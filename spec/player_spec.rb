require 'player'

describe Player do

  it 'exposes its mark' do
    expect(Player.new("X").mark).to eq "X"
  end
end
