module TicTacToe
  module Players
    class Base
      attr_reader :name, :user_interface

      def initialize(name: nil, user_interface:)
        @name = name
        @user_interface = user_interface
      end

      def turn(board)
        raise 'Not Implemented'
        # implemented in inherited classes
      end
    end
  end
end
