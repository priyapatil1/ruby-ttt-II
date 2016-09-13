class ConsoleDisplay

  ROW_SEPARATOR = "\n -------------\n"
  COLUMN_SEPARATOR = " | "

  def initialize(game, console)
    @game = game 
    @console = console
  end

  def start
    show_start_screen
    while !@game.over?
      play_turn
      show_board
    end
    display_outcome
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
    play_empty_position
  end

  def format_board
    display = ROW_SEPARATOR
    display += COLUMN_SEPARATOR + rows.flat_map { |row|
      [row, ROW_SEPARATOR]}.join(COLUMN_SEPARATOR)
  end

  private

  def rows
    @game.board.row_content
  end

  def show_greeting
    greeting = "\nWelcome to Tic Tac Toe!" +
               "\nPlease choose a position from 1 - 9\n"
    @console.show(greeting)
  end

  def play_turn
    @game.mark_position
  end

  def display_outcome
    game_won?
    game_drawn?
  end

  def game_won?
    if @game.won?
      game_won_message
    end
  end

  def game_drawn?
    if @game.drawn?
      game_drawn_message
    end
  end

  def position_taken_message
    message = "\nPlease choose an empty position"
    @console.show(message)
  end

  def game_won_message
    message = "\nGame over! #{@game.previous_player.mark} is the winner!"
    @console.show(message)
  end

  def game_drawn_message
    message = "\nGame over! It's a draw"
    @console.show(message)
  end

end
