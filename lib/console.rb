class Console

  def initialize(input, output)
    @input = input
    @output = output
  end

  def get_input
    @input.gets.chomp.to_i
  end

  def show(display)
    @output.puts display
  end

  def display_greeting
    greeting = "\nWelcome to Tic Tac Toe!" +
               "\nPlease choose a position from 1 - 9\n"
    show(greeting)
  end

  def position_taken_message
    message = "Please choose an empty position\n"
    show(message)
  end

  def within_board_message
    message = "Please enter a valid move (1-9)\n"
    show(message)
  end

end
