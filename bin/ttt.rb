#! usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'console_display'
require 'console'
require 'player'
require 'computer_player'
require 'game'

begin
  console = Console.new(STDIN, Kernel)
  player_x = Player.new("X", console)
  player_o = ComputerPlayer.new("O")
  game = Game.new(console, player_x, player_o)
  console = ConsoleDisplay.new(game, console)
  console.start
end
