require 'board'
require 'player'

class Game

  attr_reader :board
  attr_reader :player

  def initialize(console)
    @board = Board.empty_board 
    @player = Player.new("X", console)
  end

end
