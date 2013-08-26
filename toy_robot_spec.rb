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
         @report.should be_nil
       end
     end
   }
  end
end
