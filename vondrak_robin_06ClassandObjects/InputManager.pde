//06 - Class and Objects
//
//Input manager

public PVector inputAxis = new PVector(0,0);

void keyPressed()
{
	//---CONTROLS---
	if (keyCode == LEFT || key == 'a' || key == 'A')
		inputAxis.x = (-1);
	if (keyCode == RIGHT || key == 'd' || key == 'D')
		inputAxis.x = (1);
	if (keyCode == UP || key == 'w' || key == 'W')
		inputAxis.y = (-1);
	if (keyCode == DOWN || key == 's' || key == 'S')
		inputAxis.y = (1);
	
	//---CHARACTER CONTROLS---
	if(key == 'r' || key == 'R')
		restarting = true;
}

void keyReleased()
{
	if (keyCode == LEFT || key == 'a' || key == 'A')
		inputAxis.x = (0);
	if (keyCode == RIGHT || key == 'd' || key == 'D')
		inputAxis.x = (0);
	if (keyCode == UP || key == 'w' || key == 'W')
		inputAxis.y = (0);
	if (keyCode == DOWN || key == 's' || key == 'S')
		inputAxis.y = (0);
}