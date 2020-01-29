module TicTacToe
    class Board

        attr_accessor :board_size

        def initialize(board_size)
        @board_size = board_size
        @board = Array.new(@board_size) { Array.new(@board_size) { " " } }
        end
        
        def display_board
            i = 0
            j = 0
            puts
            puts "Tablero de #{@board_size} X #{@board_size}:"
            puts
            while i < @board_size do
                while j < @board_size do
                    print "|#{@board[i][j]}|"
                    j += 1
                end
                puts
                j = 0
                i += 1
            end
        end

        def get_board 
            board = @board
        end

       
        
        # def diagonal_win
        #     win = 0
        #     (0...@board).each do |x|
        #         puts x
        #     end
        # end
        
        # def diagonal_1 
        #     win1 = 0
        #     (0...@board_size).each do |x|
        #        if  @board[x][x] == 'X' || @board[x][x] == 'O' 
        #           win1 += 1
        #             if win1 == 3
        #                return true
        #             else 
        #                 return false
        #             end
        #         end
        #     end
        # end

        

        def diagonal_1  
            i = 0
            j = 0
            while i < @board_size
                while j < @board_size
                    if (i >= 1 && i < @board_size -1) && (j >= 1 && j < @board_size -1)
                        if (@board[i][j] == @board[i+1][j+1] && @board[i ][j] != " ") && (@board[i][j] == @board[i-1][j-1] && @board[i][j] != " ")
                            return true
                        end
                    end
                    j +=1
                end
                j = 0
                i += 1
            end
        end

        def diagonal_2  
            i = 0
            j = 0
            while i < @board_size
                while j < @board_size
                    if (i >= 1 && i < @board_size -1) && (j >= 1 && j < @board_size -1)
                        if (@board[i][j] == @board[i-1][j+1] && @board[i][j] != " ") && (@board[i][j] == @board[i+1][j-1] && @board[i][j] != " ")
                            return true
                        end
                    end
                    j +=1
                end
                j = 0
                i += 1
            end
        end

        def horizontal  
            i = 0
            j = 0
            while i < @board_size
                while j < @board_size
                    if (j >= 1 && j < @board_size -1)
                        if (@board[i][j] == @board[i][j+1] && @board[i][j] != " ") && (@board[i][j] == @board[i][j-1] && @board[i][j] != " ")
                            return true
                        end
                    end
                    j +=1
                end
                j = 0
                i += 1
            end
        end

        def vertical  
            i = 0
            j = 0
            while i < @board_size
                while j < @board_size
                    if (i >= 1 && i < @board_size -1) 
                        if (@board[i][j] == @board[i-1][j] && @board[i][j] != " ") && (@board[i][j] == @board[i+1][j] && @board[i][j] != " ")
                            return true
                        end
                    end
                    j +=1
                end
                j = 0
                i += 1
            end
        end
        

    end
end











