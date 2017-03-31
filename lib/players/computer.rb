require_relative './base'

module TicTacToe
  module Players
    class Computer < TicTacToe::Players::Base
      attr_reader :marker, :user_interface

      def initialize(name: 'Computer', user_interface:)
        super
        @marker = 'O'
      end

      def win_message
        puts 'Sorry. Computer wins !!'.red
        puts 'Better luck next time'.light_red
      end

      def turn(board)
        # return if board.winner || board.tie?
        user_interface.thinking(self.name)

        next_move = computer_first_move(board)
        next_move ||= try_win(board)
        next_move ||= avoid_defeat(board)
        best_move(board, marker) unless next_move
        next_move ||= @best_next_move
        board.place_marker(next_move, marker)
      end

      def computer_first_move(board)
        return nil if board.occupied_moves.count >= 2
        return 4 if board.valid_move?(4)
        return 0 if board.valid_move?(0)
      end

      def avoid_defeat(board)
        avoid_defeat_move = nil
        board.available_moves.each do |available_move|
          temp_board = board.dup
          temp_board.place_marker(available_move, switch_marker(marker))
          if temp_board.winner
            avoid_defeat_move = (temp_board.winning_combination - board.occupied_moves)[0]
            if board.valid_move?(avoid_defeat_move)
              break
            else
              avoid_defeat_move = nil
            end
          end
        end
        avoid_defeat_move
      end

      def try_win(board)
        try_win_move = nil
        board.available_moves.each do |available_move|
          temp_board = board.dup
          temp_board.place_marker(available_move, marker)
          if temp_board.winner
            try_win_move = (temp_board.winning_combination - board.occupied_moves)[0]
            break
          end
        end
        try_win_move
      end

      def best_move(board, current_marker)
        win_chances = {}
        board.available_moves.each do |available_move|
          temp_board = board.dup
          temp_board.place_marker(available_move, current_marker)
          win_chances[available_move] = best_move(temp_board, switch_marker(current_marker))
        end
        @best_next_move, @best_score = best_choice(current_marker, win_chances)
        @best_score
      end

      def best_choice(current_marker, win_chances)
        if current_marker != marker
          win_chances.max_by { |_k, v| v }
        else
          win_chances.min_by { |_k, v| v }
        end
      end

      def switch_marker(current_marker)
        return 'X' if current_marker == 'O'
        return 'O' if current_marker == 'X'
      end
    end
  end
end
