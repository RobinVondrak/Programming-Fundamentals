//03 - Vectors
//Robin Vondrak
//GP20
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/02%20-%20Learning%20to%20Program
//2020-09-10

static final int FPS = 60;
static final int MOUSE_LEFT = 37, MOUSE_RIGHT = 39;
static final float FORCE_TOP = 500;
static int ballSize = 100;
static boolean mouseDown = false;
static float speed = 0.2;
static float maxSpeed = 10;
static float legnthEffect = 2.1;
Ball ball = new Ball();

void setup()
{
	size(1120, 630);
}

void draw()
{
	background(200, 100);
	UpdateInput();
	ball.UpdateBall();
	ball.DrawBall();
}

void UpdateInput()
{
	if (mousePressed && mouseButton == MOUSE_RIGHT && !mouseDown)
	{
		mouseDown = true;
		ball.position = new PVector(mouseX, mouseY);
	}
	else if (!mousePressed)
	{
		mouseDown = false;
	}
	else if (mousePressed && mouseButton == MOUSE_LEFT)
	{
		line(ball.position.x, ball.position.y, mouseX, mouseY);
		ball.UpdateDirection();
	}
}

class Ball
{
	PVector direction = new PVector();
	PVector position = new PVector(width / 2, height /2);

	void UpdateBall()
	{
		position.sub(direction);
		CheckCollision();
	}

	void UpdateDirection()
	{
		PVector legnth = new PVector(position.x - mouseX, position.y - mouseY);
		direction.add(legnth.setMag((norm(legnth.mag(), 0, FORCE_TOP) * legnthEffect) + speed));
		direction.limit(maxSpeed);
	}

	void DrawBall()
	{
		ellipse(position.x, position.y, ballSize, ballSize);
	}

	void CheckCollision()
	{
		if (position.x < (ballSize / 2) || position.x > width - (ballSize / 2))
			direction = new PVector(direction.x * -1, direction.y);
		else if (position.y < (ballSize / 2) || position.y > height - (ballSize / 2))
			direction = new PVector(direction.x, direction.y * -1);
	}
}