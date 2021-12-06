require "rspec"

require_relative "../bingo_board"

describe BingoBoard do
  let(:board_string) {
        "14 21 17 24 4
        10 16 15 9 19
        18 8 23 26 20
        22 11 13 6 5
        2 0 12 3 7"
  }

  describe "#mark_number" do
    context "When the number is not on the board" do
      it "is falsy" do
        test_board = BingoBoard.new(board_string)
        expect(test_board.mark_number(99)).to be_falsy
      end
    end

    context "When the number is on the board" do
      it "is truthy" do
        test_board = BingoBoard.new(board_string)
        expect(test_board.mark_number(7)).to be_truthy
      end
    end
  end

  describe "#marked_at?" do
    context "when the number at the given location is not marked" do
      it "is falsy" do
        test_board = BingoBoard.new(board_string)

        expect(test_board.marked_at?([0,0])).to be_falsy
      end
    end

    context "when the number at the given location is marked" do
      it "is truthy" do
        test_board = BingoBoard.new(board_string)
        test_board.mark_number(7)

        expect(test_board.marked_at?([4,4])).to be_truthy
      end
    end
  end

  describe "#winning?" do
    context "if the board is a winning board" do
      context "horizontally" do
        it "is truthy" do
          test_board = BingoBoard.new(board_string)
          test_board.mark_number(14)
          test_board.mark_number(21)
          test_board.mark_number(17)
          test_board.mark_number(24)
          test_board.mark_number(4)

          expect(test_board.winning?).to be_truthy
        end
      end

      context "vertically" do
        it "is truthy" do
          test_board = BingoBoard.new(board_string)
          test_board.mark_number(17)
          test_board.mark_number(15)
          test_board.mark_number(23)
          test_board.mark_number(13)
          test_board.mark_number(12)

          expect(test_board.winning?).to be_truthy
        end
      end
    end

    context "if the board is not a winning board" do
      it "is falsy" do
        test_board = BingoBoard.new(board_string)
        expect(test_board.winning?).to be_falsy
      end
    end
  end

  describe "#unmarked_numbers_sum" do
    it "sums up all the unmarked numbers on the board" do
      test_board = BingoBoard.new(board_string)
      test_board.mark_number(14)
      test_board.mark_number(21)
      test_board.mark_number(17)
      test_board.mark_number(24)
      test_board.mark_number(4)
      test_board.mark_number(9)
      test_board.mark_number(23)
      test_board.mark_number(11)
      test_board.mark_number(5)
      test_board.mark_number(2)
      test_board.mark_number(0)
      test_board.mark_number(7)

      expect(test_board.unmarked_numbers_sum).to eq(188)
    end
  end
end
