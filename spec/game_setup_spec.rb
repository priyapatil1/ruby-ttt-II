require 'game_setup'
require 'console'

describe GameSetup do
  let(:output) {StringIO.new}

  it 'sets up a HvH when option 1 selected' do
    game = create_game_setup(1)
    expect(game.player_x).to be_instance_of(Player)
    expect(game.player_o).to be_instance_of(Player)
  end

  it 'sets up a HvC game when option 2 selected ' do
    game = create_game_setup(2)
    expect(game.player_x).to be_instance_of(Player)
    expect(game.player_o).to be_instance_of(ComputerPlayer)
  end

  it 'returns a CvH game when option 3 selected' do
    game = create_game_setup(3)
    expect(game.player_x).to be_instance_of(ComputerPlayer)
    expect(game.player_o).to be_instance_of(Player)
  end

  it 'returns a CvC game when option 4 selected' do
    game = create_game_setup(4)
    expect(game.player_x).to be_instance_of(ComputerPlayer)
    expect(game.player_o).to be_instance_of(ComputerPlayer)
  end

  it 'creates a HvH when no option given' do
    game = create_game_setup(0)
    expect(game.player_x).to be_instance_of(Player)
    expect(game.player_o).to be_instance_of(Player)
  end

  it 'creates a HvH when option not within menu' do
    game = create_game_setup(10)
    expect(game.player_x).to be_instance_of(Player)
    expect(game.player_o).to be_instance_of(Player)
  end

  
  private

  def create_game_setup(option)
    input = StringIO.new
    console = Console.new(input, output)
    game_setup = GameSetup.new(console)
    game_setup.create_game(option)
  end

end

