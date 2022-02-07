require_relative "grid.rb"
require_relative "player.rb"

def input(text)
    $stdout.print text.to_s
    return gets.chomp
end

class Game
    attr_accessor :grid, :players, :IA, :mode

    def initialize

        @mode = 0
        @grid = Grid.new()
        @players = Player.new()
        @IA = ""

    end

    def init()

        @grid.init()
        a = input("Choose mode : ")
        @mode = a.to_i

        if @mode == 1

            @players.create(input("Player one, choose your name : "), "X")
            @players.create(input("Player two, choose your name : "), "O")

        elsif @mode == 2

            @players.create(input("Player choose your name : "), "X")
            @IA = "IA create"

        else

            puts "Wrong mode\n"
        
        end
    end

    def display()

        if @mode == 1

            puts "player 1 : #{@players.name[0]}, token : #{@players.token[0]}"
            puts "player 2 : #{@players.name[1]}, token : #{@players.token[1]}"
            @grid.display()

        elsif @mode == 2

            puts "player : #{@players.name[0]}, token : #{@players.token[0]}"
            puts "#{@IA}"

        else

            puts "Wrong mode"

        end
    end

    def get_y(i)
    
        y = input(@players.name[i] + ", choose a column : ")
        y = y.to_i

        while (y < 1 or y > 7) or @grid.full_column(y - 1)

            y = input(@players.name[i] + ", choose valid a column : ")
            y = y.to_i

        end

        return y
    end

    def is_over()

        line = @grid.grid[0]

        for i in 0..6 do

            if line[i] == "."

                return false
            end
        end

        return true
    end
 
    def PvP()

        win = false
        i = 0
        puts "\e[H\e[2J"

        while not is_over() do

            @grid.display()
            
            y = get_y(i % 2)

            if @grid.play(y, @players.token[i % 2])

                @grid.display()
                win = true
                break
            end
            
            i += 1
            puts "\e[H\e[2J"
        end

        if win
            
            @grid.display()
            puts "#{@players.name[i % 2]} a gagné !"
        else

            @grid.display()
            puts "ÉGALITÉ !\n"
        end
    end

    def running()

        if @mode == 1

            PvP()
        elsif @mode == 2

            puts "Contre l'ia\n"
        else

            puts "Wrong mode\n"
        end
    end
end
