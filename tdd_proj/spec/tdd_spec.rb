require "rspec"
require "tdd"


describe "Array" do

  context "my_uniq" do

    it "should return an empty array when called on an empty array" do
      arr = []
      expect(arr.my_uniq).to eq([])
    end

    it "should return itself when the array has no dupes" do
      arr = [1,2,3,4,5]
      expect(arr.my_uniq).to eq(arr)
    end

    it "should return an array of unique elements when array has dupes" do
      arr = [5,1,1,2,3,4,2,3,2,2,2]
      expect(arr.my_uniq).to eq([5,1,2,3,4])
    end
  end

  context "two_sum" do

    it "should return an empty array when called on an empty array" do
      arr = []
      expect(arr.two_sum).to eq([])
    end

    it "should return an empty an array for an array without complements" do
      arr = [1,2,3,4,5]
      expect(arr.two_sum).to eq([])
    end

    it "should return an array of indices of complement pairs" do
      arr = [-1,0,2,-2,1]
      expect(arr.two_sum).to eq([[0,4], [2,3]])
    end
  end

  context "my_transpose" do

    let(:matrix) {[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]}

    let(:transposed) {[
       [0, 3, 6],
       [1, 4, 7],
       [2, 5, 8]
     ]}

    it "should return an empty array when called on an empty array" do
      matrix = []
      expect(matrix.my_transpose).to eq([])
    end

    it "should transpose a matrix" do
      expect(matrix.my_transpose).to eq(transposed)
    end
  end

end


describe "Stock Picker" do

  let(:prices) {[20, 12, 31, 8, 18]}

  it "should raise an error on empty prices array" do
    expect{stock_picker([])}.to raise_error "Needs moar prices"
  end

  it "should return emoty array when no profit possible" do
    expect(stock_picker([10,9,8])).to eq([])
  end

  it "should gives correct buy sell dates" do
    expect(stock_picker(prices)).to eq([1, 2])
  end
end

describe "Towers of Hanoi" do

  let(:hanoi) { Hanoi.new }

  context "Raise Argument Error when needed" do
    it "should raise an error on move to and from the same place" do
      expect {hanoi.move(0,0)}.to raise_error(ArgumentError)
    end

    it "should raise an error on out of bounds" do
      expect {hanoi.move(15,0)}.to raise_error(ArgumentError)
    end
  end

  context "Move" do
    it "should reject an invalid move" do
      expect(hanoi.move(1,2)).to eq(false)
      expect(hanoi.towers).to eq([[3,2,1], [], []])
    end

    it "should effect a valid move" do
      expect(hanoi.move(0,1)).to eq(true)
      expect(hanoi.towers).to eq([[3,2], [1], []])
    end
  end

  context "Winning" do

    it "should return false if not won" do
      expect(hanoi.won?).to eq(false)
    end

    it "should return true if won" do
      hanoi.towers = [[], [], [3,2,1]]
      expect(hanoi.won?).to eq(true)
    end
  end
end













#a
