require_relative "./seven_segment_number.rb"

class SegmentDecoder
  def initialize(signal_patterns)
    @signal_patterns = signal_patterns.split(" ").map{ |pattern| pattern.split("") }.sort { |a,b| a.length <=> b.length }
    @wire_positions = {}

    decode_signal_patterns
  end

  def decode(digit_pattern)
    SevenSegmentNumber.new(@wire_positions).digit(digit_pattern)
  end

  private
  def decode_signal_patterns
    initial_positions = {
      "a" => [:top, :top_left, :top_right, :middle, :bottom_left, :bottom_right, :bottom],
      "b" => [:top, :top_left, :top_right, :middle, :bottom_left, :bottom_right, :bottom], "c" => [:top, :top_left, :top_right, :middle, :bottom_left, :bottom_right, :bottom],
      "d" => [:top, :top_left, :top_right, :middle, :bottom_left, :bottom_right, :bottom],
      "e" => [:top, :top_left, :top_right, :middle, :bottom_left, :bottom_right, :bottom],
      "f" => [:top, :top_left, :top_right, :middle, :bottom_left, :bottom_right, :bottom],
      "g" => [:top, :top_left, :top_right, :middle, :bottom_left, :bottom_right, :bottom],
    }

    #determine top
    two_segment_pattern = @signal_patterns[0]
    three_segment_pattern = @signal_patterns[1]
    top_segment = three_segment_pattern.difference(two_segment_pattern)[0]

    initial_positions.delete top_segment
    initial_positions.each_pair { |key, value| value.delete(:top) }

    @wire_positions[top_segment] = :top

    #determine bottom_right, bottom_left
    count_results = @signal_patterns.reduce(Hash.new(0)) do |memo, iter|
      iter.each do |letter|
        memo[letter] += 1
      end

      memo
    end

    bottom_right_segment = count_results.select { |key, value| value == 9 }.keys[0]
    bottom_left_segment = count_results.select { |key, value| value == 4 }.keys[0]
    top_left_segment = count_results.select { |key, value| value == 6 }.keys[0]

    initial_positions.delete bottom_right_segment
    initial_positions.delete bottom_left_segment
    initial_positions.delete top_left_segment
    @wire_positions[bottom_right_segment] = :bottom_right
    @wire_positions[bottom_left_segment] = :bottom_left
    @wire_positions[top_left_segment] = :top_left

    initial_positions.each_pair { |key, value| value.delete(:bottom_right) }
    initial_positions.each_pair { |key, value| value.delete(:bottom_left) }
    initial_positions.each_pair { |key, value| value.delete(:top_left) }

    #determine top_right
    top_right_segment = initial_positions.keys.select { |key| two_segment_pattern.include? key }[0]

    initial_positions.delete top_right_segment
    @wire_positions[top_right_segment] = :top_right

    initial_positions.each_pair { |key, value| value.delete(:top_right) }

    #determine middle
    four_segment_pattern = @signal_patterns[2]
    middle_segment = initial_positions.keys.select { |key| four_segment_pattern.include? key }[0]

    initial_positions.delete middle_segment
    @wire_positions[middle_segment] = :middle

    bottom_segment = initial_positions.keys[0]
    @wire_positions[bottom_segment] = :bottom
  end
end
