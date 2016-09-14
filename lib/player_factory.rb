require 'game_option'
require 'player'
require 'computer_player'

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
    if option == GameOption::HvH || option == GameOption::HvC
      human_x
    elsif option == GameOption::CvH || option == GameOption::CvC
      computer_x
    else
      human_x
    end
  end

  def create_player_o(option)
    if option == GameOption::CvC || option == GameOption::HvC
      computer_o
    elsif option == GameOption::CvH || option == GameOption::HvH
      human_o
    else
      human_o
    end
  end

  private

  def human_o
    @player_o = Player.new("O", @console)
  end

  def human_x
    @player_x = Player.new("X", @console)
  end

  def computer_o
    @player_o = ComputerPlayer.new("O")
  end

  def computer_x
    @player_x = ComputerPlayer.new("X")
  end

end
