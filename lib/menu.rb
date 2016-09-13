require 'game'

class Menu

  attr_reader :size

  def initialize(console)
    @console = console
    @size = 5
  end

  def setup_game
    if @console.get_input == 1 
      player_x = Player.new("X", @console)
      player_o = Player.new("O", @console)
      Game.new(@console, player_x, player_o)
    end
  end

end
