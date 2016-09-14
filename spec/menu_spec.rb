require 'menu'
require 'console'

describe Menu do

  let(:output) {StringIO.new}
  let(:input) {StringIO.new}
  let(:console) {Console.new(input, output)}
  let(:exiter) {Exiter.new}

  it 'displays an initial game greeting' do
    menu = Menu.new(console, exiter)
    menu.show_initial_message
    expect(output.string).to include"\nWelcome to Tic Tac Toe!\n\n" +
                                    "Please choose from the following options:\n" +
                                    "\n1) Human vs Human\n" +
                                    "2) Human vs Computer\n" +
                                    "3) Computer vs Human\n" +
                                    "4) Computer vs Computer\n" +
                                    "5) Exit\n"
  end

  context 'executes option chosen' do

    it 'HvH game given an option of 1' do
      console = user_input("1\n1\n2\n3\n4\n5\n6\n7\n5\n")
      menu = Menu.new(console, exiter)
      menu.start
      expect(output.string).to include "Game over! X is the winner!\n"
    end

    it 'exits a game given 5' do
      console = user_input("5\n")
      menu = Menu.new(console, exiter)
      expect(menu).to receive(:exit_ttt).once
      menu.start
    end

    it 'HvH game then exit' do
      console = user_input("1\n1\n2\n3\n4\n5\n6\n7\n5\n")
      menu = Menu.new(console, exiter)
      menu.start
      expect(output.string).to include "\n -------------\n"  +
                                       " | X | O | X | \n" +
                                       " -------------\n" +
                                       " | O | X | O | \n" +
                                       " -------------\n"  +
                                       " | X | 8 | 9 | \n" +
                                       " -------------\n"
    end

    it 'HvC game then exit' do
      console = user_input("2\n1\n3\n5\n7\n5\n")
      menu = Menu.new(console, exiter)
      menu.start
      expect(output.string).to include "\n -------------\n"  +
                                       " | X | O | X | \n" +
                                       " -------------\n" +
                                       " | O | X | O | \n" +
                                       " -------------\n"  +
                                       " | X | 8 | 9 | \n" +
                                       " -------------\n"
    end

    it 'multiple HvH games then exit' do
      input = ("1\n1\n2\n3\n4\n5\n6\n7\n1\n1\n2\n3\n5\n4\n6\n8\n7\n9\n5\n")
      console = user_input(input)
      menu = Menu.new(console, exiter)
      menu.start
      expect(output.string).to include"\n -------------\n"  +
                                      " | X | O | X | \n" +
                                      " -------------\n" +
                                      " | X | O | O | \n" +
                                      " -------------\n"  +
                                      " | O | X | X | \n" +
                                      " -------------\n"
      expect(output.string).to include "\n -------------\n"  +
                                       " | X | O | X | \n" +
                                       " -------------\n" +
                                       " | O | X | O | \n" +
                                       " -------------\n"  +
                                       " | X | 8 | 9 | \n" +
                                       " -------------\n"
    end

    it 'clears screen after a game played' do
      input = ("1\n1\n2\n3\n4\n5\n6\n7\n1\n1\n2\n3\n5\n4\n6\n8\n7\n9\n5\n")
      console = user_input(input)
      menu = Menu.new(console, exiter)
      expect(menu).to receive(:clear_screen).exactly(2).times
      menu.start
    end

  end

  private

  class Exiter

    def execute
      true
    end

  end

  def user_input(moves)
    input = StringIO.new(moves)
    console = Console.new(input, output)
  end

end

