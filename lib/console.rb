class Console

  ROW_SEPARATOR = "\n -----------\n"

  def initialize(game)
    @game = game 
  end

  def format_board_display
    rows = create_rows
    display = ROW_SEPARATOR
    rows.each do |row|
       display = draw_row(display, row)
    end
    display
  end

  private

  def create_rows
    @game.board.cells.each_slice(3)
  end

  def draw_row(display, row)
    display += "| "
    row.each do |cell|
      display += cell.to_s + " | "
    end
    display << ROW_SEPARATOR
  end

end
