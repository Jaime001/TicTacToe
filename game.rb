module TicTacToe
    class Game

        attr_reader :dimension


        def initialize()
            # @array_winX = Array.new(@dimension) {"X"}
            # @array_winO = Array.new(@dimension) {"O"}
            @dimension = 3
            @player1 = Player.new("X")
            @player2 = Player.new("O")

        end
        
        #imprimir X ú O segun el jugador.
        def print_pos
            @final_turn = @turn - @error
            @turn += 1
            get_data
            if valid_move 
            @board.get_board[@final_pos[0]][@final_pos[1]] = "X" if player_in_turn == @player1 
            @board.get_board[@final_pos[0]][@final_pos[1]] = "O" if player_in_turn == @player2 
            else
                @error += 1
                puts "Esta posicion no es valida ya que esta siendo tomada por otro juegador o esta fuera del tablero!"
                print_pos
            end
        end

        def get_size_board
            puts "Ingrese el tamaño del tablero: "
            @dimension = gets.chomp.to_i
        end

        def get_data
            puts "Ingrese una posición(#{player_in_turn.player}):"
            position = gets.chomp
            @final_pos = position.split(",")
            @final_pos.collect! { |index| index.to_i }
        end

        def valid_move
            contador = 0
            @final_pos.each do |num|
                if num < @dimension && num >= 0
                  contador += 1
                end
            end
            if contador == 2
              valid_slot
            else
              false
            end
        end
        def valid_winner
            if @board.diagonal_1 
                return true
            elsif
                @board.diagonal_2
                return true
            elsif
                @board.horizontal
                return true
            elsif
                @board.vertical
                return true
            end
        end

        def play_game
            get_size_board
            @board = Board.new(@dimension)
            @final_turn = 0
            @turn = 0
            @error = 0 
            win = 0
            while @turn < (@dimension**2) + @error && valid_winner != true
                @board.display_board
                print_pos
            end
            @board.display_board
            if @turn == @dimension**2
                puts "Hay un empate"
                play_again
            else 
                puts "El jugador(#{player_in_turn.player}) es el ganador!"
                play_again
            end
        end

        def play_again
            puts "Vovler a jugar? S/N"
            answer = gets.chomp
            if answer == "S" || answer == "s"
                play_game
            else
                "Nos vemos luego!"
            end
        end

        def valid_slot
            if @board.get_board[@final_pos[0]][@final_pos[1]] == " " || @board.get_board[@final_pos[0]][@final_pos[1]] == "" || @board.get_board[@final_pos[0]][@final_pos[1]] == nil
                return true
            else
                return false 
            end
        end

        def player_in_turn
            @final_turn % 2 == 0 ? @player1 : @player2
        end

        
    end
end