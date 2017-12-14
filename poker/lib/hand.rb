class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def receive(card)
    @cards.push(card)
  end

  def discard(card_index)
    @cards.delete_at(card_index)
  end

  def <=>(other)
    something = score <=> other.score
    if something == -1
      -1
    elsif something == 1
      1
    else
      0 # Brian is very unhappy
    end
  end

  protected

  def score
    if pair?
      2
    elsif pair_of_pairs?
      3
    elsif three_of_a_kind?
      4
    elsif straight?
      5
    elsif flush?
      6
    elsif full_house?
      7
    elsif four_of_a_kind?
      8
    else
      1
    end
  end

  def pair?
    @cards.map { |card| card.value }.uniq.length == 2
  end

  def pair_of_pairs?
    @cards.map { |card| card.value }.uniq.length == 3 && !three_of_a_kind?
  end

  def three_of_a_kind?
    @cards.any? do |card|
      @cards.select { |c| c.value == card.value }.length == 3
    end
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def four_of_a_kind?
    @cards.any? do |card|
      @cards.select { |c| c.value == card.value }.length == 4
    end
  end

  def straight?
    vals = @cards.map { |card| card.value }.sort
    vals == (vals.first..(vals.first+4)).to_a
  end

  def flush?
    @cards.map { |card| card.suit }.uniq.length == 1
  end

end







#
