require "rspec"
require_relative "../segment_decoder.rb"

describe SegmentDecoder do
  context "#decode" do
    context "simple pattern" do
      let(:test_decoder) { SegmentDecoder.new("acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab") }

      it "is 5 when given cdfeb" do
        expect(test_decoder.decode("cdfeb")).to eq(5)
      end

      it "is 3 when given fcadb" do
        expect(test_decoder.decode("fcadb")).to eq(3)
      end

      it "is 3 when given cdbaf" do
        expect(test_decoder.decode("cdbaf")).to eq(3)
      end
    end

    context "complex pattern 1" do
      let(:test_decoder) { SegmentDecoder.new("be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb") }

      it "is 8 when given fdgacbe" do
        expect(test_decoder.decode("fdgacbe")).to eq(8)
      end

      it "is 3 when given cefdb" do
        expect(test_decoder.decode("cefdb")).to eq(3)
      end

      it "is 9 when given cefbgd" do
        expect(test_decoder.decode("cefbgd")).to eq(9)
      end

      it "is 4 when given gcbe" do
        expect(test_decoder.decode("gcbe")).to eq(4)
      end
    end
  end
end
