require "rspec"

require_relative "../crab_submarine.rb"

describe CrabSubmarine do
  describe "#fuel_cost_to" do
    context "starting at position 16 moving to 2" do
      it "is 14" do
        test_crab_submarine = CrabSubmarine.new(16)
        expect(test_crab_submarine.fuel_cost_to(2)).to eq(14)
      end
    end

    context "starting at position 2 moving to 2" do
      it "is 0"do
        test_crab_submarine = CrabSubmarine.new(2)
        expect(test_crab_submarine.fuel_cost_to(2)).to eq(0)
      end
    end

    context "starting at position 0 moving to 2" do
      it "is 2" do
        test_crab_submarine = CrabSubmarine.new(0)
        expect(test_crab_submarine.fuel_cost_to(2)).to eq(2)
      end
    end
  end
end
