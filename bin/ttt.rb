#! usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'console'
require 'exit'
require 'menu'

begin
  console = Console.new(STDIN, Kernel)
  Menu.new(console, Exit.new).start
end
