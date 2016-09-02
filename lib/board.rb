class Board

  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def self.empty_board
    Board.new(["-", "-", "-",
               "-", "-", "-",
               "-", "-", "-"])
  end

  def self.with_moves(cells)
    Board.new(cells)
  end

  def empty?
    !@cells.include?("O") && !@cells.include?("X")
  end

  def full?
    !@cells.include?("-")
  end

  def win_for?(mark)
    winning_row(mark) || winning_column(mark)
  end

  def equals?(board_object)
     board_object.cells == @cells
  end

  private

  def rows  
    (0..9 - 1).each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def winning_row(mark)
    rows.map {|row| row.all? {|position|
      @cells[position] == mark}}.include? true
  end

  def winning_column(mark)
    columns.map {|column| column.all? {|position|
      @cells[position] == mark}}.include? true
  end

end
