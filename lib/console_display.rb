class ConsoleDisplay

  ROW_SEPARATOR = "\n -------------\n"
  COLUMN_SEPARATOR = " | "

  def initialize(game, console)
    @game = game 
    @console = console
  end

  def start
    show_start_screen
    while !@game.board.full? && !@game.board.won?
      play_round
      game_won?
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

  def play_round
    current_player = @game.current_player
    current_move = current_player.set_current_move
    play_empty_position(@game, current_move, current_player)
    show_board
  end

  def format_board
    display = ROW_SEPARATOR
    display += COLUMN_SEPARATOR + rows.flat_map { |row|
      [row, ROW_SEPARATOR]}.join(COLUMN_SEPARATOR)
  end

  private

  def rows
    @game.board.cells.each_slice(3)
  end

  def show_greeting
    greeting = "\nWelcome to Tic Tac Toe!" +
               "\nPlease choose a position from 1 - 9\n"
    @console.show(greeting)
  end

  def play_empty_position(game, move, player)
    if @game.board.empty_position?(move)
      @game.board.mark(player.mark, move)
    else
      position_taken_message
    end
  end

  def game_won?
    if @game.board.won?
      game_won_message
    end
  end

  def position_taken_message
    message = "\nPlease choose an empty position:"
    @console.show(message)
  end

  def game_won_message
    message = "\nGame over!"
    @console.show(message)
  end

end
