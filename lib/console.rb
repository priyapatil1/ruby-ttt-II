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

  def show_greeting
    greeting = "\nWelcome to Tic Tac Toe!"
    show(greeting)
  end

  def prompt
    prompt = "\nPlease choose a position from 1 - 9\n"
    show(prompt)
  end

  def position_taken_message
    message = "Please choose an empty position\n"
    show(message)
  end

  def within_board_message
    message = "Please enter a valid move (1-9)\n"
    show(message)
  end

  def show_menu_options(options)
    display = "\nPlease choose from the following options:\n" +
              "\nEntering anything other than 1 - #{options.size} results in a Human vs Human game\n"
    options.each_with_index do |option, index|
      display += (index + 1).to_s + ") " + option + "\n"
    end
    show(display)
  end

  def clear_screen
     @output.puts "\e[H\e[2J"
  end

end
