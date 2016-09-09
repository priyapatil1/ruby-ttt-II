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

  def self.with_moves(cells)
    Board.new(cells)
  end

  def full?
    board_positions = (1..9).to_a
    !board_positions.any? { |free_position| 
      @cells.include? free_position }
  end

  def empty?
    @cells == (1..9).to_a 
  end

  def mark(symbol, position)
    @cells[position - 1] = symbol
  end

  def symbol_at(position)
    @cells[position - 1]
  end

  def remaining_cells
    @cells.count - (@cells.count("X") + @cells.count("O"))
  end

  def empty_position?(input)
    position = @cells[input - 1]
    position != "X" && position != "O"
  end

  def win?
    win_for("X") || win_for("O")
  end

  private

  def win_for(mark)
    rows.map {|row| row.all? {|position|
      @cells[position] == mark}}.include? true
  end

  def rows
    (0..(9 - 1)).each_slice(3)
  end
end
