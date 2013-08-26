require '/Users/jeromepaul/locomote/toy_robot.rb'

describe ToyRobot do
  before(:each) do
    @robot = ToyRobot.new
  end

  context "before place is called" do 
    it "should ignore move" do
      @robot.move.should be_nil
    end
    it "should ignore left" do
      @robot.left.should be_nil
    end
    it "should ignore right" do
      @robot.right.should be_nil
    end
    it "should ignore report" do
      @robot.report.should be_nil
    end
  end

  describe "place" do

    describe "with no params" do
      it "should place the robot in position 0,0 facing NORTH" do
        @robot.place
        @robot.report.should eq "#{ToyRobot::ORIGIN.inspect}, NORTH" 
      end
    end

    [[0,1],[1,0],[3,4]].each{|position|
      describe "with valid param #{position} facing SOUTH" do
        it "should place the robot in that tile facing SOUTH" do
          @robot.place(position, :SOUTH)         
          @robot.report.should eq "#{position.inspect}, SOUTH"
        end
      end  
    }

   [[-1,4], [0,5]].each{|position|
     describe "with invalid params #{position}" do 
       it "should ignore the place" do
         @robot.place(position, :NORTH)
         @robot.report.should be_nil
       end
     end
   }
  end

  describe "turning" do

    before(:each) do
      @robot.place
    end

    describe "left" do
      it "should turn from NORTH to WEST to SOUTH to EAST and back to NORTH" do
        [[:left, :WEST], [:left, :SOUTH], [:left, :EAST], [:left, :NORTH]].each{|arr|
          @robot.send(arr[0])
          @robot.facing.should eq arr[1]
        }
      end
    end
    describe "right" do 
      it "should turn from NORTH to EAST to SOUTH to WEST and back to North" do
        [[:right, :EAST], [:right, :SOUTH], [:right, :WEST], [:right, :NORTH]].each{|arr|
          @robot.send(arr[0])
          @robot.facing.should eq arr[1]
        }
      end
    end
  end

  describe "move" do
    before(:each) do
      @robot.place
    end
    describe "from the default position" do
      describe "moving NORTH" do
        it "once should move the position to 1,0" do
          @robot.move
          @robot.report.should eq "[1, 0], NORTH" 
        end 
        it "15 times should not move over the edge of the board" do
          15.times{
            @robot.move
          }
          @robot.report.should eq "[4, 0], NORTH"
        end
      end
    end
    describe "from positon [2,2], NORTH" do
      before(:each) do
        @robot.place([2,2], :NORTH)
      end

      describe "moving NORTH" do
        it "should move to 3, 2" do
          @robot.move
          @robot.report.should eq "[3, 2], NORTH"
        end
      end
      
      describe "moving WEST" do
        it "should move to 2, 1" do
          @robot.left
          @robot.move
          @robot.report.should eq "[2, 1], WEST"
        end
      end

      describe "moving SOUTH" do
        it "should move to 1, 2" do
          @robot.left
          @robot.left
          @robot.move
          @robot.report.should eq "[1, 2], SOUTH"
        end
      end

      describe "move EAST" do
        it "should move to 2, 3" do
          @robot.right
          @robot.move
          @robot.report.should eq "[2, 3], EAST"
        end
      end
    end
  end
end
