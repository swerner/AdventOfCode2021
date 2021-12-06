require_relative "./vent_field.rb"
require_relative "./vent_line.rb"

input = File.open("./problem_input").read.split("\n")

vent_field = VentField.new

input.each do |line|
  vent_field.plot(VentLine.new(line))
end

puts "Number of overlapping lines: #{vent_field.total_overlapping_points}"
