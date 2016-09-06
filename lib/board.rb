class Board
  
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def self.empty_board
    Board.new([1, 2, 3,
               4, 5, 6,
               7, 8, 9])
  end

  def empty?
    true
  end

end
