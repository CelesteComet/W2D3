require 'rspec'
require 'hand'

describe 'Hand' do

  let(:hand) { Hand.new }
  let(:card) { double('card', :value => 8, :suit => :clubs)}
  let(:other_card) { double(:value => 4, :suit => :spades)}

  let(:eight_hearts) { double(:value => 8, :suit => :hearts )}
  let(:eight_spades) { double(:value => 8, :suit => :spades )}
  let(:eight_clubs) { double(:value => 8, :suit => :clubs )}
  let(:eight_diamonds) { double(:value => 8, :suit => :diamonds )}

  let(:four_hearts) { double(:value => 4, :suit => :hearts )}
  let(:four_spades) { double(:value => 4, :suit => :spades )}
  let(:four_clubs) { double(:value => 4, :suit => :clubs )}
  let(:four_diamonds) { double(:value => 4, :suit => :diamonds )}

  let(:six_clubs) { double(:value => 6, :suit => :clubs )}
  let(:six_diamonds) { double(:value => 6, :suit => :diamonds )}

  let(:seven_clubs) { double(:value => 7, :suit => :clubs )}
  let(:seven_diamonds) { double(:value => 7, :suit => :diamonds )}

  describe "#initialize" do
    it "starts with an empty cards array" do
      expect(hand.cards).to eq([])
    end
  end

  describe "#receive" do
    it "accepts a card it's given" do
      hand.receive(card)
      expect(hand.cards.length).to be(1)
    end
  end

  describe "#discard" do
    it "discards the correct card" do
      hand.receive(card)
      hand.receive(other_card)
      hand.discard(0)
      expect(hand.cards.length).to be(1)
      expect(hand.cards.first.value).to be(4)
    end
  end

  describe "#<=>" do
    it "should return 0 is two hands are of equal value" do
      arr1 = [
        four_spades,
        four_hearts,
        eight_spades,
        eight_diamonds,
        seven_clubs
      ]

      arr2 = [
        four_diamonds,
        four_clubs,
        eight_hearts,
        eight_clubs,
        seven_diamonds
      ]

      hand1 = Hand.new
      hand1.cards = arr1

      hand2 = Hand.new
      hand2.cards = arr2

      expect(hand1 <=> hand2).to be(0)

    end

  end


end
