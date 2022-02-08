require_relative "grid.rb"

class IA
    attr_accessor :grid, :x, :y, :y_player

    def initialize

        @x = 0
        @y = 0
        @y_player = ()
        @grid = Grid.new()
    end

    def disp()

        @grid.display()
        puts "y_player : #{@y_player}"
    end

    def update(grid, y_player)

        @grid = grid.clone
        @y_player = y_player.dup
    end

    def block()

    end

    def attack()

    end

    def play()

    end
end