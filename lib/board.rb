class Board

  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def self.create_empty
    Board.new(["-", "-", "-",
               "-", "-", "-",
               "-", "-", "-"])
  end

  def empty?
    !@cells.include?("O") && !@cells.include?("X")
  end

  def full?
    !@cells.include?("-")
  end

  def win_for?(mark)
    winning_row(mark) 
  end

  def equals?(board_object)
     board_object.cells == @cells
  end

  private

  def rows  
    (0..9 - 1).each_slice(3).to_a
  end

  def winning_row(mark)
    rows.map {|combo| combo.all? {|position|
      @cells[position] == mark}}.include? true
  end

end
