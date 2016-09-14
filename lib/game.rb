require 'board'
require 'player'

class Game

  attr_reader :board
  attr_reader :player_x
  attr_reader :player_o

  def initialize(player_x, player_o)
    @board = Board.empty_board
    @player_x = player_x
    @player_o = player_o
  end

  def current_player
    @board.remaining_cells % 2 == 0 ? @player_o : @player_x
  end

  def previous_player
    @board.remaining_cells % 2 == 1 ? @player_o : @player_x
  end

  def mark_position
    current_player.set_current_move(@board)
    @board.mark_empty_position(current_player.mark, current_player.current_move)
  end

  def over?
    @board.won? || @board.full?
  end

  def won?
    @board.won?
  end

  def drawn?
    @board.full? && !@board.won?
  end

end
