require_relative "grid.rb"
require_relative "player.rb"

def input(text)
    $stdout.print text.to_s
    return gets.chomp
end

class Game
    attr_accessor :grid, :player_one, :player_two, :IA, :mode

    def initialize

        @mode = 0
        @grid = Grid.new()
        @player_one = Player.new()
        @player_two = Player.new()
        @IA = ""

    end

    def init()

        @grid.init()
        a = input("Choose mode : ")
        @mode = a.to_i

        if @mode == 1

            @player_one.create(input("Player one, choose your name : "), "X")
            @player_two.create(input("Player two, choose your name : "), "O")

        elsif @mode == 2

            @player_one.create(input("Player choose your name : "), "X")
            @IA = "IA create"

        else

            puts "Wrong mode\n"
        
        end
    end

    def display()

        if @mode == 1

            puts "player 1 : #{@player_one.name}, token : #{@player_one.token}"
            puts "player 2 : #{@player_two.name}, token : #{@player_two.token}"
            @grid.display()

        elsif @mode == 2

            puts "player : #{@player_one.name}, token : #{@player_one.token}"
            puts "#{@IA}"

        else

            puts "Wrong mode"

        end
    end

    
end
