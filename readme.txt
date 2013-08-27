You should be able to run this script from any computer with a working ruby install probably 1.9.x 

USAGE:

./robot_runner.rb
to run the tests 
rspec toy_robot_spec.rb --format documentation 

All commands are consistent with the commands listed in the requirements documentation.

The following manual test has been run:
./robot_runner.rb
place
move
report
[0, 1], NORTH
place 4,4,south
report
[4, 4], SOUTH
move
report
[4, 3], SOUTH
right
right
report
[4, 3], NORTH
move
report
[4, 4], NORTH
move
report
[4, 4], NORTH
left
report
[4, 4], WEST
move
exit
