require "rspec"

require_relative "../crab_submarine.rb"

describe CrabSubmarine do
  describe "#fuel_cost_to" do
    context "starting at position 16 moving to 5" do
      it "is 66" do
        test_crab_submarine = CrabSubmarine.new(16)
        expect(test_crab_submarine.fuel_cost_to(5)).to eq(66)
      end
    end

    context "starting at position 2 moving to 2" do
      it "is 0"do
        test_crab_submarine = CrabSubmarine.new(2)
        expect(test_crab_submarine.fuel_cost_to(5)).to eq(6)
      end
    end

    context "starting at position 0 moving to 2" do
      it "is 2" do
        test_crab_submarine = CrabSubmarine.new(0)
        expect(test_crab_submarine.fuel_cost_to(5)).to eq(15)
      end
    end
  end
end
