class ToyRobot
  ORIGIN = [0,0]
  VALID_RANGE = 0..4
  COMPASS = {
    :NORTH => {:left => :WEST, :right => :EAST},
    :SOUTH => {:left => :EAST, :right => :WEST},
    :EAST => {:left => :NORTH, :right => :SOUTH},
    :WEST => {:left => :SOUTH, :right => :NORTH}
  }

  def facing 
    @facing
  end

  def move
  end

  def left
    return unless defined? @position
    @facing = COMPASS[@facing][:left]
  end

  def right
    return unless defined? @position
    @facing = COMPASS[@facing][:right]
  end

  def report
    return unless defined? @position
    "#{@position.inspect}, #{@facing}"
  end
  
  def place(position=nil, facing=nil)
    if position == nil 
      @position = ToyRobot::ORIGIN
    elsif (ToyRobot::VALID_RANGE.include?(position[0]) && ToyRobot::VALID_RANGE.include?(position[1]))
      @position = position
    else
      return 
    end

    if facing == nil
      @facing = :NORTH
    else
      @facing = facing
    end
  end
end
