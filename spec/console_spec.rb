require 'board'
require 'game'
require 'console_display'
require 'console'

describe Console do
  let(:output) {StringIO.new("")}
  let(:console) {Console.new(output)}

  context 'new game display' do
    it 'displays an initial greeting and empty board' do
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

  context 'gets a player move' do
    it 'gets players move' do
      expect(console.get_input).to eq 1
    end
  end

end
