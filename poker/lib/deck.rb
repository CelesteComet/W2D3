class Card
  attr_reader :value, :suit

  SUITS = %I(hearts spades diamonds clubs).freeze

  def initialize(value, suit)
    unless SUITS.include?(suit) then raise ArgumentError end
    if value < 1 || value > 13 then raise ArgumentError end
    @value = value
    @suit = suit
  end
  
end

# class Deck
#
# end
