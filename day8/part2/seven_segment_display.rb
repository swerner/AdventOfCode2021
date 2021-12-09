class SevenSegmentDisplay
  attr_accessor :decoder

  def initialize(display)
    @display = display.split(" ")
  end

  def easy_digit_count
    @display.select { |digit| [2,3,4,7].include?(digit.length) }.count
  end

  def output_value
    @display.map { |pattern| @decoder.decode(pattern) }.join.to_i
  end
end
