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
    expect { Card.new(7, :spadepp)}.to raise_error(ArgumentError)
  end
end


describe "Deck" do
  

end
