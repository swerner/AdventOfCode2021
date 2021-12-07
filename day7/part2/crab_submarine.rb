class CrabSubmarine
  attr_reader :position

  def initialize(starting_position)
    @position = starting_position
  end

  def fuel_cost_to(position)
    total = 0
    ((@position - position).abs + 1).times do |number|
      total = total + number
    end

    total
  end
end
