require 'board'
require 'player'

class Game

  attr_reader :board

  def initialize
    @player_x = Player.new("X")
    @board = Board.empty_board 
  end

  def mark_board
    @board.mark(@player_x.mark, 1)
  end

end
