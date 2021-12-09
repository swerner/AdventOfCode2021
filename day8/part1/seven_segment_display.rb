class SevenSegmentDisplay
  def initialize(display)
    @display = display.split(" ")
  end

  def easy_digit_count
    @display.select { |digit| [2,3,4,7].include?(digit.length) }.count
  end
end
