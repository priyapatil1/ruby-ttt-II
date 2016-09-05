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
    @cells == (1..9).to_a
  end

  def mark(player_mark, position)
    @cells[position - 1] = player_mark 
  end

end
