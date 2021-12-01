test_input = "199
200
208
210
200
207
240
269
260
263"
input = test_input.split("\n").map(&:to_i)

input = File.open("./input").read.split("\n").map(&:to_i)


previous_depth_measurement = input[0]
increased_count = 0

input[1..-1].each do |depth_measurement|
  increased_count = increased_count + 1 if depth_measurement > previous_depth_measurement
  previous_depth_measurement = depth_measurement
end

puts "Got #{increased_count}"
# puts "Test input: Expects 7 got #{increased_count}"
