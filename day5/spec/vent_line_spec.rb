require "rspec"

require_relative "../vent_line.rb"

describe VentLine do
  context "initializing with segment" do
    it "sets the start and end positions correctly" do
      test_ventline = VentLine.new("0,9 -> 5,9")

      expect(test_ventline.startX).to eq(0)
      expect(test_ventline.startY).to eq(9)
      expect(test_ventline.endX).to eq(5)
      expect(test_ventline.endY).to eq(9)
    end
  end
end
