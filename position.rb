class Position

  attr_accessor :occupied, :fired_upon

  def initialize()
    #Sets default properties of Position
    @occupied = false
    @fired_upon = false
  end

end
