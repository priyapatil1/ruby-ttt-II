class ConsoleDisplay

  ROW_SEPARATOR = "\n -------------\n"

  def initialize(game, console)
    @game = game 
    @console = console
  end

  def start
    show_start_screen
    play_one_round
  end

  def show_start_screen
    show_greeting
    show_board
  end

  def show_board
    board = format_board
    @console.show(board)
  end

  def format_board
    rows = create_rows
    display = ROW_SEPARATOR
    display += " | " + rows.flat_map { |row|
      [row, ROW_SEPARATOR]}.join(" | ")
  end

  def play_one_round
    move = @game.player.set_current_move
    @game.board.mark("X", move)
    @console.show(format_board)
  end

  private

  def create_rows
    @game.board.cells.each_slice(3)
  end

  def show_greeting
    greeting = "\nWelcome to Tic Tac Toe!" +
               "\nPlease choose a position from 1 - 9\n"
    @console.show(greeting)
  end

end
