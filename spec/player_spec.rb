require 'player'

describe Player do 

  it 'has a mark' do
    expect(Player.new("X").mark).to eq "X"
  end

end
