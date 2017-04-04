class BoardCombinationMaker
  attr_accessor :board_size, :combinations
  def initialize(board_size: )
    @board_size = board_size
    @combinations = []
  end

  def run
    rows_combinations
    cols_combinations
    diagnol_combinations
    @combinations.uniq
  end

  def cols_combinations
    (0...board_size).each do |row|
      _combination = []
      (0...board_size).each do |col|
        _combination << row + col*board_size
      end
      combinations << _combination
    end
  end


  def rows_combinations
    (0...board_size).each do |col|
      _combination = []
      ((col*board_size)...((col+1)*board_size)).each do |row|
        _combination << row
      end
      combinations << _combination
    end
  end

  def diagnol_combinations
    _combination = []
    (0...board_size).each do |col|
      _combination << (board_size-1)*col + (board_size-1)
    end
    combinations << _combination

    _combination = []
    (0...board_size).each do |col|
      _combination << col + col*board_size
    end
    combinations << _combination
  end


end
