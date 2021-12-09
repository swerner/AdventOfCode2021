require "rspec"
require_relative "../seven_segment_display.rb"
require_relative "../segment_decoder.rb"

describe SevenSegmentDisplay do
  describe "#output_value" do
    context "sample1" do
      it "is 8394" do
        test_decoder = SegmentDecoder.new("be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb")
        test_segment_display = SevenSegmentDisplay.new("fdgacbe cefdb cefbgd gcbe")
        test_segment_display.decoder = test_decoder
        expect(test_segment_display.output_value).to eq(8394)
      end
    end

    context "sample2" do
      it "is 9781" do
        test_decoder = SegmentDecoder.new("edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec")
        test_segment_display = SevenSegmentDisplay.new("fcgedb cgb dgebacf gc")
        test_segment_display.decoder = test_decoder
        expect(test_segment_display.output_value).to eq(9781)
      end
    end
  end

  describe "#easy_digit_count" do
    it "is two when there are two" do
      test_segment_display = SevenSegmentDisplay.new("fdgacbe cefdb cefbgd gcbe")

      expect(test_segment_display.easy_digit_count).to eq(2)
    end

    it "is zero when there are zero" do
      test_segment_display = SevenSegmentDisplay.new("cefdb cefbgd")

      expect(test_segment_display.easy_digit_count).to eq(0)
    end

    it "counts a digit with two segments" do
      test_segment_display = SevenSegmentDisplay.new("efabcd cedba gadfec cb")

      expect(test_segment_display.easy_digit_count).to eq(1)
    end

    it "counts a digit with three segments" do
      test_segment_display = SevenSegmentDisplay.new("efabcd cedba gadfec cbg")

      expect(test_segment_display.easy_digit_count).to eq(1)
    end

    it "counts a digit with four segments" do
      test_segment_display = SevenSegmentDisplay.new("efabcd cedba gadfec cbga")

      expect(test_segment_display.easy_digit_count).to eq(1)
    end

    it "counts a digit with seven segments" do
      test_segment_display = SevenSegmentDisplay.new("efabcd cedba gadfec cbgaedf")
      expect(test_segment_display.easy_digit_count).to eq(1)
    end
  end
end
