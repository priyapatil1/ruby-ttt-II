require 'player'
require 'console'
require 'board'

describe Player do
  let(:output) {StringIO.new("")}
  let(:input) {StringIO.new("")}
  let(:board) {Board.empty_board}
  let(:console) {Console.new(input, output)}

  context 'player mark' do

    it 'exposes mark' do
      expect(Player.new("X", console).mark).to eq "X"
    end

    it 'exposes a different mark' do
      expect(Player.new("O", console).mark).to eq "O"
    end

  end

  context 'player move' do

    it 'sets current move' do
      player_x = moves("1\n")
      expect(player_x.set_current_move(board)).to eq 1
    end

    it 'sets a different current move' do
      player_x = moves("4\n")
      expect(player_x.set_current_move(board)).to eq 4
    end

    it 'exposes current move' do
      player_x = moves("2\n")
      player_x.set_current_move(board)
      expect(player_x.current_move).to eq 2
    end

    it 'exposes another current move' do
      player_x = moves("5\n")
      player_x.set_current_move(board)
      expect(player_x.current_move).to eq 5
    end

    it 'does not allow an invalid move to be set' do
      player_x = moves("10\n5\n")
      player_x.set_current_move(board)
      expect(output.string).to eq "Please enter a valid move (1-9)\n"
    end

    it 'does not allow a move of 10 to be set' do
      player_x = moves("10\n5\n")
      player_x.set_current_move(board)
      expect(output.string).to eq "Please enter a valid move (1-9)\n"
    end

    it 'does not allow a move of 60 to be set' do
      player_x = moves("60\n1\n")
      player_x.set_current_move(board)
      expect(output.string).to eq "Please enter a valid move (1-9)\n"
    end

    it 'does not allow a taken move to be played' do
      board = Board.with_moves(["X", 2, 3,
                                 4, 5, 6,
                                 7, 8, 9])
      player_o = moves("1\n2\n")
      player_o.set_current_move(board)
      expect(output.string).to eq "Please choose an empty position\n"
    end

  end

  private

  def moves(moves)
    input = StringIO.new(moves)
    console = Console.new(input, output)
    player_x = Player.new("X", console)
  end

end
