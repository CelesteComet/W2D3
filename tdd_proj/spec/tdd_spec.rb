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
