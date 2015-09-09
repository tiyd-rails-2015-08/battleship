class Position
  def initialize(col, row)
    @col = col
    @row = row
    @positions = [col, row]
  end

  def is_occupied?
  end

  def hit?
  end
end
