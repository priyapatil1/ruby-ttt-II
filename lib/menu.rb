require 'game'
require 'player_factory'

class Menu

  attr_reader :size
  attr_reader :game

  def initialize(console)
    @console = console
  end

  def setup_game
    option_chosen = @console.get_input
    player_factory = PlayerFactory.new(@console)
    player_factory.create_players(option_chosen)
    @game = Game.new(@console, player_factory.player_x, player_factory.player_o)
  end

end
