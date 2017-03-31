require_relative './console_user_interface.rb'

module TicTacToe
  class UserInterface
    attr_reader :console_userinterface

    def initialize(console_userinterface = TicTacToe::ConsoleUserInterface.new)
      @console_userinterface = console_userinterface
    end

    def banner
      console_userinterface.banner
    end

    def usage
      console_userinterface.usage
    end

    def turn(player)
      console_userinterface.turn(player)
    end

    def won(player)
      console_userinterface.won(player)
    end

    def tie
      console_userinterface.tie
    end

    def display_board(board)
      console_userinterface.display_board(board)
    end

    def invalid_input
      console_userinterface.invalid_input
    end

    def user_move
      console_userinterface.user_move
    end

    def thinking(player)
      console_userinterface.thinking(player)
    end
  end
end
