require '/Users/jeromepaul/locomote/toy_robot.rb'

describe ToyRobot do
  context "when initialized" do
    it "is facing north" do
      robot = ToyRobot.new
      expect(robot.facing).to eq("north")
    end
  end

end
