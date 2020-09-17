//04 - Input and Motion
//GP20
//Robin Vondrak
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/04%20-%20Input%20and%20Movement
//2020-09-XX

public static boolean gravity = false;

private color backGroundColor = #AD07AD;
private float deltaTime;
private float time = 0;

private float playerSize = 40;
private static Vector2 position;
private static Vector2 speed;
private float accelerationSpeed = 0.2;
private float dragStrength = 0.2;
private float velocityBuffer = 0.1f;
private float gravityForce = 0.19;
private Vector2 drag;
private Vector2 acceleration;
private Vector2 velocity;
private Vector2 gVelocity;
private float speedMulti = 70;


void setup()
{
	frameRate(144);
	size(640,480);
	speed = new Vector2(50, 50);
	position = new Vector2(width / 2, height / 2);
	velocity = new Vector2();
	acceleration = new Vector2(1, 1);
	drag = new Vector2(1, 1);
	gVelocity = new Vector2(1, 1);

	background(backGroundColor);

	ellipseMode(CENTER);
	noStroke();
	surface.setLocation(600,500);
}
//FEL PÅ ADD ELLER MULTIR FUNKTIONEN	
void draw()
{
	float currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;
	background(backGroundColor);

	drag.SetMag(dragStrength);
	acceleration.SetMag(accelerationSpeed);

	velocity.Add(acceleration.MultiR(inputAxis.MultiR(speedMulti)).MultiR(deltaTime));

	//---X---
	if (inputAxis.GetX() == 0 && (velocity.GetX() > velocityBuffer || velocity.GetX() < -velocityBuffer))
	{
		if (velocity.GetX() > velocityBuffer)
			velocity.Sub(drag.MultiR(deltaTime * speedMulti).GetX(), 0);
		else if (velocity.GetX() < -velocityBuffer) 
			velocity.Add(drag.MultiR(deltaTime * speedMulti).GetX(), 0);
		
	} 
	else if (inputAxis.GetX() == 0 && (velocity.GetX() < velocityBuffer && velocity.GetX() > -velocityBuffer))
	{
		velocity.SetX(0);
	}
	
	//---Y---
	if (inputAxis.GetY() == 0 && (velocity.GetY() > velocityBuffer || velocity.GetY() < -velocityBuffer))
	{
		if (velocity.GetY() > velocityBuffer)
			velocity.Sub(0, drag.MultiR(deltaTime * speedMulti).GetY());
		else if (velocity.GetY() < -velocityBuffer) 
			velocity.Add(0, drag.MultiR(deltaTime * speedMulti).GetY());
	} 
	else if(inputAxis.GetY() == 0 && (velocity.GetY() < velocityBuffer && velocity.GetY() > -velocityBuffer) && !gravity)
	{
		velocity.SetY(0);
	}
	
	DoTheBounce();
	position.Add(velocity.MultiR(deltaTime * speedMulti));

	ellipse(
		position.GetX(),
		position.GetY(),
		playerSize, playerSize);

	time = currentTime;

	OutOfBounds();
}

void DoTheBounce()
{
	if (!gravity)
		return;

	if (position.GetY() > height)
	{
		velocity.SetY(velocity.GetY() * -1);
		position.SetY(height);
	} 

	gVelocity.Add(gravityForce);
	gVelocity.Multi(deltaTime * speedMulti);
	gVelocity.SetX(0);	
	velocity.Add(gVelocity);
}

void OutOfBounds()
{
	if (position.GetX() < (0 - (playerSize / 2)))
	{
		position.SetX(width + playerSize / 3);
	}
	else if (position.GetX() > (width + (playerSize / 2)))
	{
		position.SetX(0 - playerSize / 3);
	}
	else if (position.GetY() < (0 - (playerSize / 2)))
	{
		position.SetY(height + playerSize / 3);
	}
	else if (position.GetY() > (height + (playerSize / 2)))
	{
		position.SetY(0 - playerSize / 3);
	}
}