class UnbeatablePlayer 

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def move(board)
    empty_cells = board.all_empty_positions
    empty_cells.each do |position|
      new_board = board.mark_empty_position(@mark, position + 1)
      if new_board.won?
        return position + 1
      end
    end
  end
  
end
