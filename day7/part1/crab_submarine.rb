class CrabSubmarine
  attr_reader :position

  def initialize(starting_position)
    @position = starting_position
  end

  def fuel_cost_to(position)
    (@position - position).abs
  end
end
