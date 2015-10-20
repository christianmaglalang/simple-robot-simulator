Title & Description

	Simple Robot Simulator

	The application is a simulation of a toy robot moving on a square tabletop 
	of dimensions, 5 units x 5 units.
	
	There are no other obstructions on the table surface.
	
	The robot is free to roam the surface of the table, but will be prevented from falling. 
	Any movement that would result in the robot falling from the table will be prevented. 
	However, further valid movement commands will still be allowed.

Environments

	This application was developed on OSX El Capitan 10.11 with ruby version of 2.2.3p173,
	managed using rbenv and bundler.

	Compatible/tested environments
		ruby >= 2.1.0p0

	Incompatible environments
		ruby < 2.1.0

System Dependencies & Configuration

	Before we install and run the application, ensure environment is correctly configured.

	Ruby version must be greater than or equal to ruby 2.1.0p0. 
	Recommended version is 2.2.3p173

	To check your version, run:
		ruby -v

	To install ruby using rbenv, type in terminal:
		rbenv install 2.2.3-p173

Application Installation Instructions

	Note: Before installing, make sure rbenv has at least ruby 2.1.0p0 installed.

	To check this, run:
		rbenv versions

	To install recommended ruby version, please see System Dependencies & Configuration 
	part of this README.

	To install the application:

	1. Clone the repository from github to directory of your choice:
		git clone https://github.com/christianmaglalang/simple-robot-simulator

	2. Install the bundler, run:
		gem install bundler

	3. Install rspec, run:
		bundle install

	4. Congratulations, you can now run the application.


Usage Instructions

	To run the application, type in terminal:
		ruby robot_simulator.rb

	Available Commands:
		PLACE X,Y,F
			PLACE will put the robot on the table in position X,Y and facing NORTH, SOUTH,
			EAST WEST.

			X is the x coordinate of a 5x5 table. The origin is 0,0.
			Y is the y coordinate of a 5x5 table.
			F could be any of these: NORTH, SOUTH, EAST, WEST
			(capitalization/uppercase not required)

			ex: PLACE 0,0,NORTH or 0,0,north

		MOVE
			MOVE will move the robot one unit forward in the direction it is facing.

		LEFT
			LEFT will rotate the robot 90 degrees and face left without changing 
			the position of the robot.

		RIGHT
			RIGHT will rotate the robot 90 degrees and face right without changing 
			the position of the robot.

		REPORT
			REPORT will announce the X,Y,F of the robot.

			Example output: 0,0,NORTH
		END
			END will close and end the application.

	Rules:
		1. You must first place the robot on the 5x5 table. This means that the first 
		   valid command would be a PLACE command.

		2. A robot that is not on the table will not accept any other commands.

		3. The robot will prevent itself from falling, whether from a MOVE command 
		   or PLACE command. The robot will retain its location prior to the command 
		   that would cause it to fall.


Testing Instructions
	
	This application includes a test suite which used RSPEC and can be found in the 
	spec folder.

	To execute this application's test suite, you must have the rspec gem installed.

	This gem is already listed in the Gemfile included.

	To install, type in the command line: 
		bundle install

	To run the tests, type in the command line:
		rspec spec

Overview

	This application is designed to read input commands from the terminal and print the 
	necessary output depending on the commands.

	Input Formats:

		PLACE X,Y,F

			X is expected to be an integer from 0-4(5x5)
			Y is expected to be an integer from 0-4(5x5)
			F is expected to be one of these strings (NORTH,SOUTH,EAST,WEST)

			ex: PLACE 0,1,SOUTH

	Output Formats:

		REPORT
			When REPORT command is invoked, the application will print the current 
			location of the robot in this format:

				X,Y,F

			ex: 0,1,SOUTH

		The application will print an error message when you enter an invalid input.

			ex: Robot will fall

	Examples:

		1. 
			Input: 
				PLACE 0,0,NORTH
				MOVE
				REPORT

			Output:
				0,1,NORTH

		2.
			Input:
				PLACE 0,0,SOUTH
				MOVE

			Output:
				Robot will fall

	Design:
		This application is divided into 3 parts.

		1. Runnable Script robot_simulator.rb
			It's an executable ruby script that reads in the input from terminal. 
			It automatically instantiates the robot class once the script is run. 
			It also handles all the invalid inputs before running the appropriate 
			methods of the robot class.

		2. Robot class
			This class contains all the methods and attributes of the robot. 
			Once the executable script handles the input, it uses the methods 
			of this class to do the appropriate command. It is designed to be 
			extendable in case you want to write a more advanced robot. If you 
			create your own executable ruby script, you can also change the 
			dimensions of the table from 5x5 to any dimension.

		3. Test suite
			The test suite can be found in spec folder. It is written using RSPEC. 
			To run the test suite, please see Testing Instructions section of this README.

