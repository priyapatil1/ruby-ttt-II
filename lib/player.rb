class Player

  attr_reader :mark
  attr_reader :move_given

  def initialize(mark)
    @mark = mark 
  end

  def set_current_move(move_given)
    @move_given = move_given
  end

  def current_move
    @move_given
  end

end
