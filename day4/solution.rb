require "pry"
require_relative "./bingo_board.rb"

# input_file = "./test_input"
input_file = "./problem_input"

input = File.open(input_file).read
split_input = input.split("\n\n")

drawn_numbers = split_input[0].split(",").map(&:to_i)
board_strings = split_input[1..-1]

boards1 = board_strings.map { |bs| BingoBoard.new(bs) }
boards2 = board_strings.map { |bs| BingoBoard.new(bs) }

drawn_numbers.each do |drawn_number|
  boards1.map { |board| board.mark_number(drawn_number) }

  if boards1.any? { |board| board.winning? }
    winning_board = boards1.select { |board| board.winning? }.first
    puts "First winning board score: #{winning_board.unmarked_numbers_sum * drawn_number}"
    break
  end
end

drawn_numbers.each do |drawn_number|
  boards2.map { |board| board.mark_number(drawn_number) }

  if boards2.any? { |board| board.winning? }
    if boards2.length == 1
      puts "Last winning board score: #{boards2[0].unmarked_numbers_sum * drawn_number}"
      break
    else
      boards2.reject! { |board| board.winning? }
    end
  end
end
