require_relative "./seven_segment_display.rb"

input_file = "./puzzle_input"
# input_file = "./test_input"

input = File.open(input_file).read.split("\n")

count = 0

input.each do |input_line|
  display = SevenSegmentDisplay.new(input_line.split(" | ")[1])
  count = count + display.easy_digit_count
end

puts "Number of easy digits: #{count}"
