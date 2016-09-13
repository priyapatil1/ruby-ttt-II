class Board

  attr_reader :cells

  def initialize(cells)
    @cells = cells
    @size = cells.length
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
    board_positions = (1..@size).to_a
    !board_positions.any? { |free_position| @cells.include? free_position }
  end

  def empty?
    @cells == (1..@size).to_a
  end

  def mark_empty_position(symbol, position)
    cell_to_mark = @cells[position - 1]
    if cell_to_mark != "X" && cell_to_mark != "O"
      @cells[position - 1] = symbol
    end
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

  def won?
    win_for("X") || win_for("O")
  end

  def row_content
    @cells.each_slice(3)
  end

  def within_board?(move)
    move.between?(1, @size)
  end

  private

  def win_for(mark)
    winning_line(columns, mark) || winning_line(rows, mark) || winning_line(diagonals, mark)
  end

  def winning_line(lines, mark)
    lines.any? do |line|
      line.all? { |position| @cells[position] == mark}
    end
  end

  def rows
    line_length = Math.sqrt(@size)
    (0..(@size - 1)).each_slice(line_length)
  end

  def columns
    rows.to_a.transpose
  end

  def diagonals
    left_to_right = [0, 4, 8]
    right_to_left = [2, 4, 6]
    [left_to_right, right_to_left]
  end

end
