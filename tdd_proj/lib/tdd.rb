class Array
  def my_uniq
    m_hash = {}
    self.each do |e|
      m_hash[e] = true
    end
    m_hash.keys
  end

  def two_sum
    results = []
    complements = {}
    each_with_index do |e, i|
      if complements.keys.include?(e)
        results << [complements[e], i]
      else
        complements[-e] = i
      end
    end
    results.sort
  end

  def my_transpose
    result = []
    each_with_index do |row, row_index|
      new_row = []
      row.each_with_index do |e, col_index|
        new_row << self[col_index][row_index]
      end
      result << new_row
    end
    result
  end

end

def stock_picker(prices)
  raise ArgumentError.new "Needs moar prices" if prices.empty?

  result = []
  max_profit = -1

  prices.each_with_index do |buy_price, buy_i|
    prices.each_with_index do |sell_price, sell_i|
      next unless buy_i < sell_i

      if max_profit < sell_price - buy_price
        max_profit = sell_price - buy_price
        result = [buy_i, sell_i]
      end
    end
  end
  result
end

class Hanoi
  attr_accessor :towers
  def initialize
    @towers = [[3,2,1], [], []]
  end

  def move(from, to)
    raise ArgumentError if from == to
    raise ArgumentError if from >= @towers.length || from < 0
    raise ArgumentError if to >= @towers.length || to < 0
    return false if @towers[from].empty?
    return false if @towers[to].last && @towers[from].last > @towers[to].last
    @towers[to] << @towers[from].pop
    true
  end

  def won?
    @towers[0..-2].none? {|t| t.length > 0 }
  end

  def play
    until won?
      print @towers
      puts
      from = prompt_user(:from)
      to = prompt_user(:to)
      move(from, to)
    end
  end

  def prompt_user(loc)
    if loc == :from
      puts "Please enter a from location:"
    elsif loc == :to
      puts "Please enter a to location:"
    end
    return gets.chomp.to_i
  end
end

 h = Hanoi.new
 h.play
