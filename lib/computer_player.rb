class ComputerPlayer

  attr_reader :mark
  attr_reader :current_move

  def initialize(mark)
    @mark = mark
  end

  def set_current_move(board)
    @current_move = board.first_empty_position + 1
  end

end
