class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark 
  end

  def set_current_move(move_given)
    move_given
  end

  def current_move
    2
  end

end
