require "rspec"
require_relative "../lanternfish_school.rb"

describe LanternfishSchool do
  describe "#go_forward" do
    let (:test_lanternfish_school) { LanternfishSchool.new("3,4,3,1,2") }

    describe "after 1 day" do
      it "is correct" do
        test_lanternfish_school.go_forward(1)
        expect(test_lanternfish_school.fish).to eq([2,3,2,0,1])
      end
    end

    describe "after 6 days" do
      it "is correct" do
        test_lanternfish_school.go_forward(6)
        expect(test_lanternfish_school.fish).to eq([4,5,4,2,3,4,5,6,6,7])
      end
    end

    describe "after 13 days" do
      it "is correct" do
        test_lanternfish_school.go_forward(13)
        expect(test_lanternfish_school.fish).to eq([4,5,4,2,3,4,5,6,6,0,4,5,6,6,6,7,7,8,8])
      end
    end

    describe "after 18 days" do
      it "is correct" do
        test_lanternfish_school.go_forward(18)
        expect(test_lanternfish_school.fish).to eq([6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8])
      end
    end
  end
end
