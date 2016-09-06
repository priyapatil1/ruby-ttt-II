class Player

  attr_reader :mark

  def initialize(mark, console)
    @mark = mark 
    @console = console
  end

  def set_current_move
    @move_given = @console.get_input 
  end

  def current_move
    @move_given
  end

end
