require_relative './console_user_interface.rb'

module TicTacToe
  class UserInterface
    attr_reader :console_user_interface

    def initialize(console_user_interface = TicTacToe::ConsoleUserInterface.new)
      @console_user_interface = console_user_interface
    end

    def banner
      console_user_interface.banner
    end

    def usage
      console_user_interface.usage
    end

    def turn(player)
      console_user_interface.turn(player)
    end

    def quit(player)
      console_user_interface.quit(player)
    end

    def won(player)
      console_user_interface.won(player)
    end

    def tie
      console_user_interface.tie
    end

    def display_board(board)
      console_user_interface.display_board(board)
    end

    def invalid_input
      console_user_interface.invalid_input
    end

    def user_move
      console_user_interface.user_move
    end

    def thinking(name)
      console_user_interface.thinking(name)
    end
  end
end
