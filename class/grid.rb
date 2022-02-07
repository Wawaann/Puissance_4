require_relative "player.rb"

class Grid
    attr_accessor :grid, :line, :colums, :dia_one, :dia_two 

    def initialize
    
        @n = 6
        @m = 7
        @grid = []
        @line = []
        @colums = []
        @dia_one = []
        @dia_two = []

    end

    def init()
    
        while @grid.length < @n do
            
            tmp = []
            while tmp.length < @m do
                
                tmp.append('.')

            end
    
            @grid.append(tmp)
        end
    end

    def display()

        c = 6
        print("\n   1   2   3   4   5   6   7\n\n")
        len = @grid.length - 1
        for i in 0..len do
            
            print(c)
            len_tmp = @grid[i].length - 1
            for j in 0..len_tmp do
    
                print("   ", @grid[i][j])
    
            end
    
            print("\n\n")
            c -= 1
        end
    end

    def get_line(x)

        @line = []
        @line = @grid[x]
    end

    def get_colums(y)

        @colums = []
        len = @grid.length - 1

        for i in 0..len do
            
            @colums.append(@grid[i][y])
        end
    end
    
    def get_dia_one(x, y)

        @dia_one = []

        while x > 0 and y > 0 do
    
            x -= 1
            y -= 1
        end
        
        len = @grid.length
        len_line = @grid[0].length

        while x < len and y < len_line do
    
            @dia_one.append(@grid[x][y])
            x += 1
            y += 1
        end
    
    end

    def get_dia_two(x, y)

        @dia_two = []
        len = @grid.length - 1

        while x < len and y > 0 do
            
            x += 1
            y -= 1
        end
    
        len_line = @grid[0].length
        while x >= 0 and y < len_line do
            
            @dia_two.append(@grid[x][y])
            x -= 1
            y += 1
        end
    end

    def list_win(list, ch)

        token = 0
        len = list.length - 1

        for i in 0..len do
            
            if list[i] == ch

                token += 1

                if token == 4

                    return true
                end
            else

                token = 0
            end
        end

        return false
    end

    def full_column(y)
    
        if @grid[0][y] != "."

            return true
        end

        return false
    end

    def find_x(y)
    
        x = 0
        len = @grid.length - 1
        for i in 0..len do

            if @grid[i][y] == '.'

                x = x + 1
            end
        end

        x -= 1
        return x
    end

    def insert(y, ch)

        x = find_x(y)
        @grid[x][y] = ch
        return x
    end

    def play(y, ch)

        y -= 1
        x = insert(y, ch)
        get_line(x)
        get_colums(y)
        get_dia_one(x, y)
        get_dia_two(x, y)

        if list_win(@line, ch)

            return true
    
        elsif list_win(@colums, ch)

            return true
    
        elsif list_win(@dia_one, ch)

            return true
        
        elsif list_win(@dia_two, ch)

            return true

        end

        return false
    end

end
