
class Position

  attr_reader :number1, :number2, :has_ship_on, :hit


  def initialize(number1, number2)
    @number1 = number1
    @number2 = number2
    @has_ship_on = false
    @hit = false
  end

  def has_ship_on?(number1, number2)
    if grid.has_ship_on?(number1, number2)
      @has_ship_on = true
    else
    end
  end

  def hit?(number1, number2)
    if grid.has_ship_on?(@number1, @number2)
      @hit = true
    else
    end
  end





end
