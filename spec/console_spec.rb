require 'board'
require 'game'
require 'console_display'
require 'console'

describe Console do
  let(:output) {StringIO.new("")}

  context 'new game display' do

    it 'displays an initial greeting and empty board' do
      input = StringIO.new("")
      console = Console.new(input, output)
      console.start
      expect(output.string).to eq "\nWelcome to Tic Tac Toe!" +
        "\nPlease choose a position from 1 - 9\n" +
        "\n -------------\n "  +
        "| 1 | 2 | 3 | \n" +
        " -------------\n " +
        "| 4 | 5 | 6 | \n" +
        " -------------\n "  +
        "| 7 | 8 | 9 | \n" +
        " -------------\n"
    end
  end

  context 'gets a move' do

    it 'gets first move' do
      input = StringIO.new("1\n")
      console = Console.new(input, output)
      expect(console.get_input).to eq 1
    end

    it 'gets another different move' do
      input = StringIO.new("3\n")
      console = Console.new(input, output)
      expect(console.get_input).to eq 3
    end

    it 'gets second move' do
      input = StringIO.new("1\n5\n")
      console = Console.new(input, output)
      console.get_input
      expect(console.get_input).to eq 5
    end
  end

end
