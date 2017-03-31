module TicTacToe
  class Board
    attr_reader :all_moves, :length

    def initialize(size: 3)
      @length = size
      @all_moves = Array.new(@length**2)
    end

    def moves
      all_moves.compact.count
    end

    def place_marker(user_move, marker)
      all_moves[user_move] = marker
    end

    def valid_move?(user_move)
      (0..8).include?(user_move) && space_available?(user_move)
    end

    def space_available?(move)
      all_moves[move].nil?
    end

    def available_moves
      all_moves.map.with_index { |key, index| index if key.nil? }.reject!(&:nil?)
    end

    def occupied_moves
      all_moves.map.with_index { |key, index| index unless key.nil? }.reject!(&:nil?)
    end

    def winning_combination
      winning_combinations.each do |winning_combination|
        if all_moves[winning_combination[0]] == all_moves[winning_combination[1]] &&
          all_moves[winning_combination[1]] == all_moves[winning_combination[2]]
          return winning_combination unless all_moves[winning_combination[0]].nil?
        end
      end
      false
    end

    def winner
      if _winning_combination = winning_combination
        all_moves[_winning_combination[0]]
      else
        false
      end
    end

    def tie?
      available_moves.empty?
    end

    private

    def winning_combinations
      @winning_combinations ||= [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal
        [0, 3, 6], [1, 4, 7], [2, 5, 8], # Horizontal
        [0, 4, 8], [2, 4, 6] # Diagonal wins
      ]
    end

    def initialize_dup(existing_board)
      super(existing_board)
      @all_moves = existing_board.all_moves.dup
    end
  end
end

