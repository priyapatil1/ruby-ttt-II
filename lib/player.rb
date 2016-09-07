class Player

  attr_reader :mark
  attr_reader :current_move

  def initialize(mark, console)
    @mark = mark 
    @console = console
  end

  def set_current_move
    @current_move = @console.get_input 
  end

end
