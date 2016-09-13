#! usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'console_display'
require 'console'
require 'player'
require 'game'

begin
  console = Console.new(STDIN, Kernel)
  game = Game.new(console)
  console = ConsoleDisplay.new(game, console)
  console.start
end
