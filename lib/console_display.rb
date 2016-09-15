class ConsoleDisplay

  ROW_SEPARATOR = "\n -------------\n"
  COLUMN_SEPARATOR = " | "

  def initialize(game, console)
    @game = game
    @console = console
  end

  def start
    show_board
    show_prompt
    while !@game.over?
      play_turn
      clear_screen
      show_board
    end
    display_outcome
  end

  def show_prompt
    @console.prompt
  end

  def show_board
    board = format_board
    @console.show(board)
  end

  def format_board
    display = ROW_SEPARATOR
    display += COLUMN_SEPARATOR
    display += rows.flat_map do |row|
      [row, ROW_SEPARATOR]
    end.join(COLUMN_SEPARATOR)
  end

  private

  def play_turn
    @game.mark_position
  end

  def rows
    @game.board.row_content
  end

  def show_greeting
    @console.display_greeting
  end

  def display_outcome
    if @game.won?
      game_won_message
    elsif @game.drawn?
      game_drawn_message
    end
  end

  def game_won_message
    message = "\nGame over! #{@game.previous_player.mark} is the winner!"
    @console.show(message)
  end

  def game_drawn_message
    message = "\nGame over! It's a draw"
    @console.show(message)
  end

  def clear_screen
    @console.clear_screen
  end

end
