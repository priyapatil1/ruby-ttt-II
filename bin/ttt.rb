#! usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'console'

begin
  console = Console.new(Kernel)
  console.start
end
