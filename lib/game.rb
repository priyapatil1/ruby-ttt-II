require 'board'
require 'player'

class Game

  attr_reader :board
  attr_reader :player_x
  attr_reader :player_o

  def initialize(console)
    @board = Board.empty_board 
    @player_x = Player.new("X", console)
    @player_o = Player.new("O", console)
  end

  def calculate_current_player
    @board.remaining_cells % 2 == 0 ? @player_o : @player_x
  end

end
