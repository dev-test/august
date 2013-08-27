#! /usr/bin/env ruby
require_relative "toy_robot"

robot = ToyRobot.new

while input = gets
  case input
  when /^PLACE$/i
    robot.place
  when /^PLACE \d,\d,NORTH|SOUTH|EAST|WEST$/i
    data = input.match(/^PLACE (\d),(\d),(\w*)$/i)
    robot.place([data[1].to_i, data[2].to_i], data[3]) 
  when /^MOVE$/i
    robot.move
  when /^LEFT$/i
    robot.left
  when /^RIGHT$/i
    robot.right
  when /^REPORT$/i
    puts robot.report
  when /^EXIT$/i
    exit 
  else
    puts "unknown command, valid commands are: PLACE, 'PLACE x,y,facing', MOVE, LEFT, RIGHT, REPORT or EXIT"
  end
end 
