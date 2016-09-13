require 'menu'
require 'console'
require 'computer_player'

describe Menu do
  let(:output) {StringIO.new("")}

  it 'returns a HvH game when 1 entered' do
    input = StringIO.new("1\n")
    console = Console.new(input, output)
    menu = Menu.new(console)
    menu.setup_game
    expect(menu.game.player_x).to be_instance_of(Player)
    expect(menu.game.player_o).to be_instance_of(Player)
  end

  it 'returns a HvC game when 2 entered' do
    input = StringIO.new("2\n")
    console = Console.new(input, output)
    menu = Menu.new(console)
    menu.setup_game
    expect(menu.game.player_x).to be_instance_of(Player)
    expect(menu.game.player_o).to be_instance_of(ComputerPlayer)
  end

  it 'returns a CvH game when 3 entered' do
    input = StringIO.new("3\n")
    console = Console.new(input, output)
    menu = Menu.new(console)
    menu.setup_game
    expect(menu.game.player_x).to be_instance_of(ComputerPlayer)
    expect(menu.game.player_o).to be_instance_of(Player)
  end

  it 'returns a CvC game when 4 entered' do
    input = StringIO.new("4\n")
    console = Console.new(input, output)
    menu = Menu.new(console)
    menu.setup_game
    expect(menu.game.player_x).to be_instance_of(ComputerPlayer)
    expect(menu.game.player_o).to be_instance_of(ComputerPlayer)
  end

end
