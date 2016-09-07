class ConsoleDisplay

  ROW_SEPARATOR = "\n -------------\n"

  def initialize(game, console)
    @game = game 
    @console = console
  end

  def start
    show_start_screen
    while !@game.board.full?
      play_round
    end
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

  def play_round
    current_player = @game.calculate_current_player
    move = current_player.set_current_move
    if @game.board.empty_position?(move)
      @game.board.mark(current_player.mark, move)
    end
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
