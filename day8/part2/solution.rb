require_relative "./seven_segment_display.rb"
require_relative "./segment_decoder.rb"

input_file = "./puzzle_input"
# input_file = "./test_input"

input = File.open(input_file).read.split("\n")

count = 0

input.each do |input_line|
  patterns, display_string = input_line.split(" | ")
  decoder = SegmentDecoder.new(patterns)
  display = SevenSegmentDisplay.new(input_line.split(" | ")[1])
  display.decoder = decoder

  count = count + display.output_value
end

puts "Number of easy digits: #{count}"
