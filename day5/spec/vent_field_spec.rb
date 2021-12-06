require "rspec"
require "pry"

require_relative "../vent_field.rb"

describe VentField do
  describe "#plot" do
    context "when given a ventline that is diagonal" do
      context "sample1" do
        it "plots correctly" do
          test_vent_field = VentField.new
          test_vent_field.plot(VentLine.new("1,1 -> 3,3"))

          expect(test_vent_field.field[[1,1]]).to eq(1)
          expect(test_vent_field.field[[2,2]]).to eq(1)
          expect(test_vent_field.field[[3,3]]).to eq(1)
          expect(test_vent_field.field.values.count).to eq(3)
        end
      end

      context "sample2" do
        it "plots correctly" do
          test_vent_field = VentField.new
          test_vent_field.plot(VentLine.new("9,7 -> 7,9"))

          expect(test_vent_field.field[[9,7]]).to eq(1)
          expect(test_vent_field.field[[8,8]]).to eq(1)
          expect(test_vent_field.field[[7,9]]).to eq(1)
          expect(test_vent_field.field.values.count).to eq(3)
        end
      end
    end

    context "when given a ventline whose startX is greater than its endX" do
      it "plots correctly" do
        test_vent_field = VentField.new

        test_vent_field.plot(VentLine.new("8,0 -> 0,0"))

        expect(test_vent_field.field[[8,0]]).to eq(1)
      end
    end

    context "when given a ventline whose startY is greater than its endY" do
      it "plots correctly" do
        test_vent_field = VentField.new

        test_vent_field.plot(VentLine.new("0,8 -> 0,0"))

        expect(test_vent_field.field[[0,0]]).to eq(1)
      end
    end
  end

  describe "#total_overlapping_points" do
    context "when no lines have been plotted" do
      it "is zero" do
        test_vent_field = VentField.new

        expect(test_vent_field.total_overlapping_points).to eq(0)
      end
    end

    context "when there are no overlapping vent lines plotted" do
      it "is zero" do
        test_vent_field = VentField.new
        test_vent_field.plot(VentLine.new("2,2 -> 2,1"))
        test_vent_field.plot(VentLine.new("7,0 -> 7,4"))

        expect(test_vent_field.total_overlapping_points).to eq(0)
      end
    end

    context "when the given test input vent lines are plotted" do
      it "is correct" do
        test_vent_field = VentField.new
        test_vent_field.plot(VentLine.new("0,9 -> 5,9"))
        test_vent_field.plot(VentLine.new("8,0 -> 0,8"))
        test_vent_field.plot(VentLine.new("9,4 -> 3,4"))
        test_vent_field.plot(VentLine.new("2,2 -> 2,1"))
        test_vent_field.plot(VentLine.new("7,0 -> 7,4"))
        test_vent_field.plot(VentLine.new("6,4 -> 2,0"))
        test_vent_field.plot(VentLine.new("0,9 -> 2,9"))
        test_vent_field.plot(VentLine.new("3,4 -> 1,4"))
        test_vent_field.plot(VentLine.new("0,0 -> 8,8"))
        test_vent_field.plot(VentLine.new("5,5 -> 8,2"))

        expect(test_vent_field.total_overlapping_points).to eq(12)
      end
    end
  end
end
