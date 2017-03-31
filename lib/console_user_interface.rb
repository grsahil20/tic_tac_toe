require 'colorize'

module TicTacToe
  class ConsoleUserInterface
    def banner
      puts "Tic Tac Toe!".green
    end

    def usage
      puts "Enter the coordinates for where you want to move".yellow
      puts "Ex: '0' would move you to the 1st column, 1st row".blue
      puts "Press 'q' to Quit".red
      puts ""
    end

    def won(player)
      puts "Player #{player} WINS!".green
    end

    def tie
      puts 'NONE WINS !'.yellow
    end

    def display_board(board)
      output = "\n"
      (0..(board.length**2 -1)).to_a.each do |position|
        output << color(board, position)
        case position % board.length
        when (board.length - 1)
          output << "\n-----------\n" if position != (board.length**2 -1)
        else
          output << "|"
        end
      end
      puts output
    end

    def invalid_input
      puts "\nInvalid input....".red
      puts "please try again.".light_red
    end

    def user_move
      print ""
      print "Mark at ? "
      gets.chomp.strip
    end

    def thinking(piece)
      puts "\nPlayer #{piece} is thinking..."
    end

    private

    def color(board, position)
      if board.all_moves[position]
        " #{board.all_moves[position]} "
      else
        " #{position} ".light_black
      end
    end
  end
end
