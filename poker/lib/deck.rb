SUITS = %I(hearts spades diamonds clubs).freeze

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    unless SUITS.include?(suit) then raise ArgumentError end
    if value < 1 || value > 13 then raise ArgumentError end
    @value = value
    @suit = suit
  end

end

class Deck

  def initialize
    @cards = []

    (1..13).each do |value|
      SUITS.each do |suit|
        @cards.push(Card.new(value, suit))
      end
    end
  end

  def empty?
    @cards.empty?
  end

  def provide_card
    @cards.pop
  end

  def size
    @cards.length
  end
end
