class ToyRobot
  ORIGIN = [0,0]

  def facing 
    @facing
  end

  def move
  end

  def left
  end

  def right
  end

  def report
    return unless defined? @position
    "#{@position.inspect}, #{@facing}"
  end
  
  def place(position=nil, facing=nil)
    @position = position
    @facing = facing

    @position = ToyRobot::ORIGIN unless @position
    @facing = :NORTH unless @facing
  end
end
