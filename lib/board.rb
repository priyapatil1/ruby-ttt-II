class Board

  def initialize(cells)
    @cells = cells
  end

  def empty?
    !@cells.include?("O") && !@cells.include?("X")
  end

  def full?
    !@cells.include?("-")
  end

end
