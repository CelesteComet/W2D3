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
