require 'console_display'

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

end
