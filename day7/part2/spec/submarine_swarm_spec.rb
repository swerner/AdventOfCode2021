require "rspec"

require_relative "../submarine_swarm.rb"

describe SubmarineSwarm do
  let(:test_swarm) { SubmarineSwarm.new("16,1,2,0,4,2,7,1,2,14") }

  describe "#total_fuel_to" do
    xit "is 41 when moving to position 1" do
      expect(test_swarm.total_fuel_to(1)).to eq(41)
    end

    it "is 206 when moving to position 2" do
      expect(test_swarm.total_fuel_to(2)).to eq(206)
    end

    xit "is 39 when moving to position 3" do
      expect(test_swarm.total_fuel_to(3)).to eq(39)
    end

    xit "is 71 when moving to position 10" do
      expect(test_swarm.total_fuel_to(10)).to eq(71)
    end
  end

  describe "#cheapest_swarm_position" do
    it "is 5" do
      expect(test_swarm.cheapest_swarm_position).to eq(5)
    end
  end

  describe "#cheapest_fuel_cost" do
    it "is 168" do
      expect(test_swarm.cheapest_fuel_cost).to eq(168)
    end
  end
end
