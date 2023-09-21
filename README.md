Robot Control Code:
This repository contains code for controlling a robot using a LEGO Mindstorms EV3 brick. The robot can perform various actions based on color detection and ultrasonic distance measurements. Additionally, it can be remotely controlled using keyboard inputs.

Prerequisites:
Before you can run this code, make sure you have the following:

LEGO Mindstorms EV3 brick with the required sensors and motors.
MATLAB installed on your computer.

Setup:
Connect your LEGO Mindstorms EV3 brick to your computer.
Open MATLAB and load this code into the MATLAB editor.

Usage:
Run the code in MATLAB.
The code will initialize the keyboard for remote control and configure the color sensor and ultrasonic sensor.

Color Detection:
If the color sensor detects blue, the robot will stop and enter remote control mode.
If the color sensor detects green and the robot is not currently picking something up, it will stop and enter remote control mode.
If the color sensor detects red, the robot will brake for traffic and then proceed.

Remote Control:
While in remote control mode, you can use the following keyboard inputs:
'n' - Move the robot forward.
's' - Move the robot backward.
'w' - Turn the robot left.
'e' - Turn the robot right.
'uparrow' - Lift the robot's arm up.
'downarrow' - Lower the robot's arm down.
'q' - Quit remote control mode.

Wall Detection:
The ultrasonic sensor is used to detect the distance to a wall.
If the distance to the wall is less than 26 units, the robot will adjust its movement.
If the distance to the wall is between 26 and 65 units, the robot will make another adjustment.
If the ultrasonic sensor can't find a wall, the robot will perform a turn.

Task Completion:
Once the robot completes its tasks, it will stop all motors and display "End" in the MATLAB console.

Contributing:
If you'd like to contribute to this project, please create a fork of the repository, make your changes, and submit a pull request

Acknowledgments:
This code was created for educational purposes and can be further customized for specific robotics projects.
Special thanks to the LEGO Mindstorms EV3 community for their support and inspiration.
