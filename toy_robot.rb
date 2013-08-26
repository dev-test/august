class ToyRobot
  ORIGIN = [0,0]
  VALID_RANGE = 0..4
  COMPASS = {
    :NORTH => {:left => :WEST, :right => :EAST, :move => [1,0]},
    :SOUTH => {:left => :EAST, :right => :WEST, :move => [-1,0]},
    :EAST => {:left => :NORTH, :right => :SOUTH, :move => [0,1]},
    :WEST => {:left => :SOUTH, :right => :NORTH, :move => [0,-1]}
  }

  def facing 
    @facing
  end

  def move
    return unless defined? @position
    move = COMPASS[@facing][:move]
    new_position = [@position[0]+move[0], @position[1]+move[1]]

    if (VALID_RANGE.include?(new_position[0]) && VALID_RANGE.include?(new_position[1]))
      @position = new_position
    end
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
      @position = ORIGIN
    elsif (VALID_RANGE.include?(position[0]) && VALID_RANGE.include?(position[1]))
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
