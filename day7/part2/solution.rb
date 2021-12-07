require_relative "./submarine_swarm.rb"

input = File.open("./problem_input").read

solution_swarm = SubmarineSwarm.new(input)

puts "Optimal Fuel Cost: #{solution_swarm.cheapest_fuel_cost}"
