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
    if empty(board, move) && within_board(move)
      @current_move = move
    elsif !empty(board, move)
      @console.show("Please choose an empty position\n")
      set_current_move(board)
    elsif !within_board(move)
      @console.show("Please enter a valid move (1-9)\n")
      set_current_move(board)
    end
  end

  def empty(board, move_given)
    board.empty_position?(move_given)
  end

  def within_board(move_given)
    move_given.between?(1,9)
  end

end
