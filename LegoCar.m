global key    %Get the key variable 
InitKeyboard();
brick.SetColorMode(1,2);
color = brick.ColorCode(4);
distance = brick.UltrasonicDist(1);
pick = 1;
completed = 1;
remoteControl = 0;

color = brick.ColorCode(4); %updates color sensor
if color == 2 %if color is blue 
brick.StopAllMotors('Brake');
remoteControl = 1;
pick = 0;
elseif (color == 3 && pick == 0) %if color is green 
brick.StopAllMotors('Brake');
remoteControl = 1;
elseif color == 5 %if color is red brake for traffic
brick.StopAllMotors('Brake');
pause(2);
brick.MoveMotor('A', -55);

pause(0.925);
elseif (color == 4 && pick == 0)
brick.MoveMotor('A', -60);
brick.MoveMotor('D', -50); 
pause(0.75);
brick.StopAllMotors('Brake');
completed = 0;
break;
end
while remoteControl == 1 %Remote control commands
pause(0.1); %delay
brick.StopAllMotors();
switch key
case 'n' %Front 
brick.MoveMotor('A', -60);
brick.MoveMotor('D', -50);
case 's' %Back
brick.MoveMotor('A', 60);
brick.MoveMotor('D', 50);
case 'w' %Left
brick.MoveMotor('A', -25);
brick.MoveMotor('D', 25);
case 'e' %Right
brick.MoveMotor('A', 25);
brick.MoveMotor('D', -25);
case 'uparrow' %Lift up 
brick.MoveMotor('C', -20);
case 'downarrow' %Lift down 
brick.MoveMotor('C', 20);
case 'q' %Quits remote control
remoteControl = 0;
break;
end 
end
if (brick.TouchPressed(3) == 3) 
brick.MoveMotor('A', 20);
brick.MoveMotor('D', 23); %backs up
pause(0.5);
brick.StopAllMotors('Brake');
pause(0.5);
brick.StopAllMotors('Brake');
brick.MoveMotor('A', -25); %Turns left 90 degrees left
brick.MoveMotor('D', 25);
pause(1.1);
brick.StopAllMotors('Brake');
pause(2);
end
distance = brick.UltrasonicDist(1); %wall sensor
disp(distance);
if (distance < 26)
brick.MoveMotor('A', -50);
brick.MoveMotor('D', -50);
pause(0.16);
elseif (distance > 26 && distance < 65)
brick.MoveMotor('A', -50);
brick.MoveMotor('D', -70);
pause(0.16); 
elseif (distance > 65) %if wall sensor can't find a wall then turn starts
brick.StopAllMotors('Brake');
pause(0.2);
brick.MoveMotor('A', -60);
brick.MoveMotor('D', -50); %adjusts forward to prepare for turn
pause(0.2);
brick.StopAllMotors('Brake');
pause(0.2);
brick.MoveMotor('A', 45); %Turns left 90 degrees right
brick.MoveMotor('D', -45);
pause(0.5);
brick.StopAllMotors('Brake');
pause(2);
brick.MoveMotor('A', -60);
brick.MoveMotor('D', -50); %adjusts forward 
pause(0.75);
color = brick.ColorCode(1); %if color is red brake. 
brick.StopAllMotors('Brake');
pause(2);
brick.MoveMotor('A', -60);
brick.MoveMotor('D', -50); 
pause(1.25);
brick.StopAllMotors('Brake');
pause(1);
end
brick.MoveMotor('A', -60);
brick.MoveMotor('D', -50); 
end
brick.StopAllMotors('Brake'); %Task completed!!
disp("End");
CloseKeyboard();
