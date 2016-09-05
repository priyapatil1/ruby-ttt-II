require 'board'

class Game

  attr_reader :board

  def initialize
    @board = Board.empty_board 
  end

end
