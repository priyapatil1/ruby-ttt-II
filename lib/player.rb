class Player

  attr_reader :mark
  attr_reader :current_move

  def initialize(mark, console)
    @mark = mark 
    @console = console
  end

  def set_current_move(board)
    move = @console.get_input
    valid_move(board, move)
  end

  private

  def valid_move(board, move)
    if board.empty_position?(move) && board.within_board?(move)
      @current_move = move
    elsif !board.empty_position?(move)
      @console.position_taken_message
      set_current_move(board)
    elsif !board.within_board?(move)
      @console.within_board_message
      set_current_move(board)
    end
  end

end
