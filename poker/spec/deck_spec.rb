require "rspec"
require "deck"

describe "Card" do
  let(:card) { Card.new(7, :hearts)}

  it "raise an Argument Error on bad value argument" do
    expect { Card.new(42, :spade)}.to raise_error(ArgumentError)
  end

  it "initializes with a value" do
    expect(card.value).to eq(7)
  end

  it "initializes with a suit" do
    expect(card.suit).to eq(:hearts)
  end

  it "raises argument error on bad suit" do
    expect { Card.new(7, :spadepp) }.to raise_error(ArgumentError)
  end
end


describe "Deck" do
  let(:deck) { Deck.new }

  describe "#empty?" do
    it "empty? should return false on a fresh deck" do
      expect(deck.empty?).to eq(false)
    end

    it "empty? should return true on an empty deck" do
      52.times do
        deck.provide_card
      end
      expect(deck.empty?).to eq(true)
    end
  end

  describe "#initialize" do

    it "should populate the deck with 52 cards" do
      expect(deck.size).to be(52)
    end

    it "should have the right cards" do
      class Deck
        attr_reader :cards
      end
      expect(deck.cards.select { |card| card.value == 8 }.length).to eq(4)
      expect(deck.cards.select { |card| card.suit == :clubs }.length).to eq(13)
    end
  end

  describe "#provide_card" do
    it "should give us back a card" do
      expect(deck.provide_card).to be_an_instance_of(Card)
      expect(deck.size).to be(51)
    end
  end

end
