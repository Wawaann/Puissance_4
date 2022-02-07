#!/usr/bin/env ruby
require_relative "class/game.rb"

game = Game.new()

game.init()

game.running()


# while 1 do

#     grid.display()
#     y = input("Choose column : ")
#     y = y.to_i
    
#     if not grid.play(y, "X")
#         grid.display()
#     else

#         grid.display()
#         puts "Gagné !!\n"
#         break
#     end

#     grid.display()
#     y = input("Choose column : ")
#     y = y.to_i
    
#     if not grid.play(y, "O")
#         grid.display()
#     else

#         grid.display()
#         puts "Gagné !!\n"
#         break
#     end

# end
