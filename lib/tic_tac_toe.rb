require_relative './user_iterface'
require_relative './board'
require_relative './players/user'
require_relative './players/computer'


module TicTacToe
  class Game

    attr_accessor :user_interface, :board, :human, :computer

    def initialize(user:)
      @user_interface = TicTacToe::UserInterface.new
      @board = TicTacToe::Board.new
      @human = TicTacToe::Players::User.new(name: user, user_interface: user_interface)
      @computer = TicTacToe::Players::Computer.new(user_interface: user_interface)
      display_info
    end

    def play
      player, opponent = human, computer
      game_over = false
      begin
        player.turn(board)
        user_interface.display_board(board)
        if !game_over && board.winner
          game_over = true
          player.win_message
        end
        if !game_over && board.tie?
          game_over = true
        end
        player, opponent = opponent, player
      end while !game_over
    end

    private
    def display_info
      user_interface.banner
      user_interface.usage
      user_interface.display_board(board)
      puts ''
    end
  end
end
