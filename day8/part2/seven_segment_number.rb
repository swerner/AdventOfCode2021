require "pry"

class SevenSegmentNumber
  def initialize(wire_positions)
    @wire_positions = wire_positions
  end

  def digit(pattern)
    letters = pattern.split("")
    values = letters.map { |letter| @wire_positions[letter] }

    return 8 if [:top,:top_left,:top_right,:middle,:bottom_left,:bottom_right,:bottom].difference(values) == []
    return 6 if [:top,:top_left,:middle,:bottom_left,:bottom_right,:bottom].difference(values) == []
    return 9 if [:top,:top_left,:top_right,:middle,:bottom_right,:bottom].difference(values) == []
    return 0 if [:top,:top_left,:top_right,:bottom_left,:bottom_right].difference(values) == []
    return 2 if [:top,:top_right,:middle,:bottom_left,:bottom].difference(values) == []
    return 3 if [:top,:top_right,:middle,:bottom_right,:bottom].difference(values) == []
    return 5 if [:top,:top_left,:middle,:bottom_right,:bottom].difference(values) == []
    return 4 if [:top_left,:top_right,:middle,:bottom_right].difference(values) == []
    return 7 if [:top,:top_right,:bottom_right].difference(values) == []
    return 1 if [:top_right,:bottom_right].difference(values) == []
  end
end
