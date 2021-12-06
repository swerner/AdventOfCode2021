class VentLine
  attr_reader :startX, :startY, :endX, :endY

  def initialize(segment)
    start_pos, end_pos = segment.split(" -> ")

    @startX, @startY = start_pos.split(",").map(&:to_i)
    @endX, @endY = end_pos.split(",").map(&:to_i)
  end
end
