require 'player_factory'

class GameSetup

  attr_reader :game

  def initialize(console)
    @console = console
  end

  def create_game(option_chosen)
    player_factory = PlayerFactory.new(@console)
    player_factory.create_players(option_chosen)
    @game = Game.new(player_factory.player_x, player_factory.player_o)
  end

end
