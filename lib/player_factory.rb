require 'game_types'
require 'player'
require 'computer_player'
require 'game'

class PlayerFactory

  attr_reader :player_x
  attr_reader :player_o

  def initialize(console)
    @console = console
  end

  def create_players(option)
    create_player_x(option)
    create_player_o(option)
  end

  def create_player_x(option)
    if option == GameType::HvH || option == GameType::HvC
      @player_x = Player.new("X", @console)
    elsif option == GameType::CvH || option == GameType::CvC
      @player_x = ComputerPlayer.new("X")
    end
  end

  def create_player_o(option)
    if option == GameType::CvC || option == GameType::HvC
      @player_o = ComputerPlayer.new("O")
    elsif option == GameType::CvH || option == GameType::HvH
      @player_o = Player.new("O", @console)
    end
  end

end
