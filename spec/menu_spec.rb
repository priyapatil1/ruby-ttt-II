require 'menu' 
require 'console' 

describe Menu do
  let(:output) {StringIO.new("")}

  it 'holds four types of games' do
    input = StringIO.new("")
    console = Console.new(input, output)
    menu = Menu.new(console)
    expect(menu.size).to eq 5
  end

  it 'returns a HvH game when a user enters 1' do
    input = StringIO.new("1\n")
    console = Console.new(input, output)
    menu = Menu.new(console)
    expect(menu.setup_game.player_x).to be_instance_of(Player)
  end

end
