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

    #validar turno
    def player_in_turn
       @turn % 2 == 0 ? "player X" : "player O"
    end

    #imprimir X ú O segun el jugador. 
    def print_pos
        puts "\n\n#{player_in_turn}: "
        position = gets.chomp
        @final_pos = position.split(",")
        @final_pos.collect! { |index| index.to_i }
        if valid_move && valid_slot
        @board[@final_pos[0]][@final_pos[1]] = "O" if player_in_turn == "player O" 
        @board[@final_pos[0]][@final_pos[1]] = "X" if  player_in_turn == "player X" 
        else 
            @error += 1
            puts "Esta posicion no es valida o ya esta tomada por otro juegador."
            print_pos 
            
        end
    end

    def valid_move
        contador = 0
        @final_pos.each do |num| 
            if num < @board_size && num >= 0
            contador += 1
            end
        end
        if contador == 2
            return true
        else 
            return false 
        end
    end

    #ciclo para iniciar el juego
    def play_game
        @error = 0
        @turn = 0
        while @turn < (@board_size**2) + @error
            display_board
            print_pos
            @turn += 1
            if @board == @board_size**2 
                break
            end
        end
    end
    
    #validar si el espacio esta disponilbe 
    def valid_slot
        if @board[@final_pos[0]][@final_pos[1]] == " " || @board[@final_pos[0]][@final_pos[1]] == "" || @board[@final_pos[0]][@final_pos[1]] == nil
            return true
        else
            return false
        end
    end
    

end

game1 = Board.new(3)
game1.play_game
game1.diagonal_winner







