require 'computer_player'

describe ComputerPlayer do 
  it 'has a mark' do
    computer_player = ComputerPlayer.new("X")
    expect(computer_player.mark).to eq "X"
  end

end

