require "rspec"

require_relative "../seven_segment_number.rb"

describe SevenSegmentNumber do
  describe "#digit" do
    context "default case" do
      let(:test_seven_segment_number) {
        SevenSegmentNumber.new({
          "a" => :top,
          "b" => :top_left,
          "c" => :top_right,
          "d" => :middle,
          "e" => :bottom_left,
          "f" => :bottom_right,
          "g" => :bottom
        })
      }

      it "is 1 when given cf" do
        expect(test_seven_segment_number.digit("cf")).to eq(1)
      end

      it "is 0 when given abcefg" do
        expect(test_seven_segment_number.digit("abcefg")).to eq(0)
      end

      it "is 0 when given gfbace" do
        expect(test_seven_segment_number.digit("gfbace")).to eq(0)
      end

      it "is 9 when given abcdfg" do
        expect(test_seven_segment_number.digit("abcdfg")).to eq(9)
      end
    end
  end
end
