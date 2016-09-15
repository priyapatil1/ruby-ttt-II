require 'player_factory'
require 'console'

describe PlayerFactory do

  let(:input) {StringIO.new}
  let(:output) {StringIO.new}
  let(:console) {Console.new(input, output)}
  let(:player_factory) {PlayerFactory.new(console)}

  it 'creates a two human players given 1' do
    player_factory.create_players(1)
    expect(player_factory.player_x).to be_instance_of(Player)
    expect(player_factory.player_o).to be_instance_of(Player)
  end

  it 'creates a human and computer players given 2' do
    player_factory.create_players(2)
    expect(player_factory.player_x).to be_instance_of(Player)
    expect(player_factory.player_o).to be_instance_of(UnbeatablePlayer)
  end

  it 'creates a computer and human players given 3' do
    player_factory.create_players(3)
    expect(player_factory.player_x).to be_instance_of(UnbeatablePlayer)
    expect(player_factory.player_o).to be_instance_of(Player)
  end

  it 'creates two computer players given 4' do
    player_factory.create_players(4)
    expect(player_factory.player_x).to be_instance_of(UnbeatablePlayer)
    expect(player_factory.player_o).to be_instance_of(UnbeatablePlayer)
  end

end
