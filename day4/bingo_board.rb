class BingoBoard
  def initialize(board_string)
    @board = {}

    board_string.split("\n").each_with_index do |line, row|
      line.split(" ").each_with_index do |number, column|
        @board[[row, column]] = [number.to_i, false]
      end
    end
  end

  def mark_number(number)
    return false unless @board.values.map(&:first).include?(number)

    @board.values.each do |value|
      value[1] = true if value[0] == number
    end
  end

  def marked_at?(coordinates)
    @board[coordinates][1]
  end

  def winning?
    winning_horizontally? || winning_vertically?
  end

  def unmarked_numbers_sum
    unmarked_values = @board.values.select{ |value| value[1] == false }
    unmarked_values.sum { |value| value[0] }
  end

  private
  def winning_horizontally?
    (0..4).each do |row|
      return true if (0..4).map { |column| @board[[row, column]][1] }.all?(true)
    end

    false
  end

  def winning_vertically?
    (0..4).each do |column|
      return true if (0..4).map { |row| @board[[row, column]][1] }.all?(true)
    end

    false
  end
end
