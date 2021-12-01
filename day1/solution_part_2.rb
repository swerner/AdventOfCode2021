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
expected_test_output = [607, 618, 618, 617, 647, 716, 769, 792]

def measurement_window_sums(measurements)
  processed_measurements = measurements.split("\n").map(&:to_i)
  output = []

  processed_measurements.each_with_index do |measurement, index|
    break if !processed_measurements[index+1] || !processed_measurements[index+2]

    output << (measurement + processed_measurements[index+1] + processed_measurements[index+2])
  end

  return output
end

puts "Test Values Correct: #{measurement_window_sums(test_input) == expected_test_output}"

input = measurement_window_sums(test_input)
previous_depth_measurement = input[0]
increased_count = 0

input[1..-1].each do |depth_measurement|
  increased_count = increased_count + 1 if depth_measurement > previous_depth_measurement
  previous_depth_measurement = depth_measurement
end

puts "Test Values depth increase counts: Expected: 5 Got: #{increased_count}"

problem_input = File.open("./input").read

input = measurement_window_sums(problem_input)
previous_depth_measurement = input[0]
increased_count = 0

input[1..-1].each do |depth_measurement|
  increased_count = increased_count + 1 if depth_measurement > previous_depth_measurement
  previous_depth_measurement = depth_measurement
end
puts "Problem solution: #{increased_count}"
