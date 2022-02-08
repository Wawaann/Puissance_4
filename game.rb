#!/usr/bin/env ruby
require_relative "class/game.rb"

game = Game.new()

game.init()

game.running()

# ia = IA.new()

# grid = Grid.new()
# grid.init()
# grid.insert(2, "X")

# ia.update(grid, 2)

# ia.disp()
