class UnbeatablePlayer 

  attr_reader :mark
  attr_reader :current_mark

  def initialize(mark)
    @mark = mark
    @current_mark = @mark
  end

  def move(board)
    winning_move = 0
    board.all_empty_positions.each do |position|
      new_board = board.mark_empty_position(@current_mark, position + 1)
      if score(new_board) == 1 && @current_mark == "O"
        return winning_move = position + 1
      end
      new_board = board.mark_empty_position("X", position + 1)
      mark = switch_mark(@current_mark)
      if score(new_board) == 1 && mark == "X"
        winning_move = position + 1
      end
      end
    winning_move
  end

  private

  def switch_mark(mark)
    mark == "O" ? "X" : "O"
  end

  def score(new_board)
    new_board.won? ? 1 : 0
  end
end
