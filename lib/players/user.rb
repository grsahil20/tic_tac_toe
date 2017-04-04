require_relative './base'

module TicTacToe
  module Players
    class User < TicTacToe::Players::Base
      attr_reader :marker, :user_interface, :quit

      def initialize(name: nil, user_interface:)
        super
        @marker = 'X'
      end

      def win_message
        puts 'Congratulations'.green
        puts 'You won !!'.light_green
      end

      def turn(board)
        valid_turn = false

        input = user_interface.turn(name)

        begin
          input = user_interface.user_move
          if quit_game?(input)
            user_interface.quit(self)
            @quit = true
            valid_turn = true
          else
            valid_turn = validate(input, board)
          end
        end while !valid_turn

        board.place_marker(input.to_i, @marker)
      end

      def quit_game?(input)
        input == 'q'
      end

      def validate(input, board)
        input_validation = !input.empty? && board.valid_move?(input.to_i) && input.match(/\d/)
        user_interface.invalid_input unless input_validation
        input_validation
      end
    end
  end
end
