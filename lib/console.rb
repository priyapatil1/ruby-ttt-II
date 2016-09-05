class Console

  def initialize(game)
    @game = game 
  end

  def board_display
    add_padding(@game.board.cells.each_slice(3)
    .flat_map {|row| [row, "\n"]}
    .join(" | ")
    .prepend("| "))
  end

  private

  def add_padding(display)
    display.prepend(" -----------\n")
    display << " -----------\n"
  end

end
