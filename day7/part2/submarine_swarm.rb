require_relative "./crab_submarine.rb"
require "pry"

class SubmarineSwarm
  def initialize(swarm_positions)
    @submarines = swarm_positions.split(",").map { |position| CrabSubmarine.new(position.to_i) }
  end

  def total_fuel_to(position)
    @submarines.sum { |submarine| submarine.fuel_cost_to(position) }
  end

  def cheapest_fuel_cost
    total_fuel_to(cheapest_swarm_position)
  end


  def cheapest_swarm_position
    start_position = @submarines.min { |submarine_a, submarine_b| submarine_a.position <=> submarine_b.position }.position
    end_position = @submarines.max{ |submarine_a, submarine_b| submarine_a.position <=> submarine_b.position }.position

    current_position = start_position
    cheapest_position = current_position

    current_cheapest_fuel = total_fuel_to(current_position)

    while(current_position <= end_position) do
      if current_cheapest_fuel > total_fuel_to(current_position)
        cheapest_position = current_position
        current_cheapest_fuel = total_fuel_to(current_position)
      end

      current_position = current_position + 1
    end

    cheapest_position
  end
end
