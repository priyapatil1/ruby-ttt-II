class Player

  attr_reader :mark
  attr_reader :current_move

  def initialize(mark, console)
    @mark = mark 
    @console = console
  end

  def set_current_move
    move_given = @console.get_input
    if move_given.between?(1,9)
      @current_move = move_given
    else
      @console.show("Please enter a valid move (1-9)")
      set_current_move
    end
  end

end
