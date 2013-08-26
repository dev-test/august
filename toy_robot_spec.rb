require '/Users/jeromepaul/locomote/toy_robot.rb'

describe ToyRobot do
  context "when initialized" do
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
  end

end
