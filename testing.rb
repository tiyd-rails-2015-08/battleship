class Ship
  attr_reader :length
  def initialize(length)
    @length = length
    @positions = []

  end

  def place(x, y, across)
    return false !@positions.empty? #return false if @positions is NOT empty
    if across
      (x...x+@length).each do |i|
      @positions << [i, y]
      end
    else
      (y...y+@length).each do |i|
      @positions << [x, i]
      end
    end
  end

  def covers?(x, y)
   @positions.include?([x,y])
  end

  def overlaps_with?(other_ship)
    @positons.each do |place|
    return true if other.covers?(place[0],place[1])
  end
  false
end


@grid = {
    1 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    2 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    3 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    4 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    5 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    6 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    7 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    8 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    9 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."},
    10 => {"A"=>".", "B"=>".", "C"=>".", "D"=>".", "E"=>".", "F"=>".", "G"=>".", "H"=>".", "I"=>".", "J"=>"."}
}
