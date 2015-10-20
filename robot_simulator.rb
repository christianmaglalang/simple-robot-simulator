#!/usr/bin/env ruby

require_relative 'robot'

# checks if user have entered a place command
def check_command(robot)
  if robot.coordinate_x.nil?
    puts 'Enter place command first'
    return false
  else
    return true
  end
end

# start of execution
prompt = '> '

simple_robot = Robot.new(5,5)

puts "Robot is on. Place it on #{simple_robot.table_size_x + 1}x#{simple_robot.table_size_y + 1} table."
print prompt

# will keep accepting user input until user enters END/end
while user_input = gets.chomp
  case user_input.upcase
  when 'MOVE'
    if check_command(simple_robot)
      simple_robot.move
    end
  when 'LEFT'
    if check_command(simple_robot)
      simple_robot.left
    end
  when 'RIGHT'
    if check_command(simple_robot)
      simple_robot.right
    end
  when 'REPORT'
    if check_command(simple_robot)
      simple_robot.report
    end
  when 'END'
    break
  else
    # make sure it's a place command
    if user_input.slice!(0..5).upcase == 'PLACE '
      array_param = user_input.gsub(/\s+/, "").split(',')
      # make sure there's exactly 3 arguments for place command
      if array_param.count != 3
        puts 'Invalid number of arguments for command PLACE(3)'
      else
        simple_robot.place(array_param[0], array_param[1], array_param[2])
      end
    # otherwise, don't accept any commands
    else
      puts 'Invalid input'
    end
  end
  print prompt
end