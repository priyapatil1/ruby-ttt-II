class ConsoleDisplay

  ROW_SEPARATOR = "\n -------------\n"

  def initialize(game)
    @game = game 
  end

  def format_board
    rows = create_rows
    display = ROW_SEPARATOR
    display += " | " + rows.flat_map { |row|
      [row, ROW_SEPARATOR]}.join(" | ")
  end

  private

  def create_rows
    @game.board.cells.each_slice(3)
  end

end
