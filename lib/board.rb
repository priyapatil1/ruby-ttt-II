class Board

  def initialize(cells)
    @cells = cells
  end

  def empty?
    @cells == (1..9).to_a
  end

end
