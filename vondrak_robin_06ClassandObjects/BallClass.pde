//06 - Class and Objects
//
//Ball class

public class Ball
{
	public PVector pos;

	private float _sizeRadius;
	private color _color;
	private PVector _velocity;
	private float _speedLow = 200;
	private float _speedHigh = 500;

	//---CONSTRUCTOR---
	Ball(float ballRadSize, color ballColor)
	{
		_sizeRadius = ballRadSize;
		_color = ballColor;
		pos = new PVector();
		_velocity = new PVector(random(_speedLow, _speedHigh), random(_speedLow, _speedHigh));
		
		int rand = int(random(0, 3));
		switch (rand)
		{
			case 0:
			_velocity.x *= -1;
			break;

			case 2:
			_velocity.y *= -1;
			break;
		}
	}
	//---DISPLAY BALL---
	void DrawBall()
	{
		fill(_color);
		ellipse(pos.x, pos.y, _sizeRadius * 2, _sizeRadius * 2);
	}
	//---BALL MOVEMENT---
	void Move()
	{
		pos.add(new PVector(_velocity.x * Time.deltaTime, _velocity.y * Time.deltaTime));
		OutOfBounds();
		DrawBall();
	}

	void OutOfBounds()
	{
		if (pos.x < _sizeRadius)
		{
			pos.x = _sizeRadius;
			_velocity.x *= -1;
		}
		else if (pos.x > width - _sizeRadius)
		{
			pos.x = width - _sizeRadius;
			_velocity.x *= -1;
		}

		if (pos.y < _sizeRadius)
		{
			pos.y = _sizeRadius;
			_velocity.y *= -1;
		}
		else if (pos.y > height - _sizeRadius)
		{
			pos.y = height - _sizeRadius;
			_velocity.y *= -1;
		}
	}
};