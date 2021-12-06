require "rspec"
require_relative "../lanternfish_school.rb"

describe LanternfishSchool do
  describe "#go_forward2" do
    let (:test_lanternfish_school) { LanternfishSchool.new("3,4,3,1,2") }

    describe "after 1 day" do
      it "is correct" do
        test_lanternfish_school.go_forward2(1)
        expect(test_lanternfish_school.fish2.values.sum).to eq(5)
      end
    end

    describe "after 6 days" do
      it "is correct" do
        test_lanternfish_school.go_forward2(6)
        expect(test_lanternfish_school.fish2.values.sum).to eq(10)
      end
    end

    describe "after 18 days" do
      it "is correct" do
        test_lanternfish_school.go_forward2(18)
        expect(test_lanternfish_school.fish2.values.sum).to eq(26)
      end
    end

    describe "after 256 days" do
      it "is correct" do
        test_lanternfish_school.go_forward2(256)
        expect(test_lanternfish_school.fish2.values.sum).to eq(26984457539)
      end
    end
  end
end
