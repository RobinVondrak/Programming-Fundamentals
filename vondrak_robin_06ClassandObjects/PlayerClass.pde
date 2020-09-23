//06 - Class and Objects
//
//Player class

public class Player
{
	public PVector pos = new PVector(width / 2, height / 2);

	private color _color;
	private float _sizeRadius;
	private float _speed;
	private float _maxDistance;

	Player(float radius, color playerColor, float speed)
	{
		_color = playerColor;
		_sizeRadius = radius;
		_speed = speed;
	}

	public void Move()
	{
		fill(_color);
		PVector _inputTemp = inputAxis.copy();
		pos.add(_inputTemp.mult(Time.deltaTime * _speed));
		ellipse(pos.x, pos.y, _sizeRadius * 2, _sizeRadius * 2);
		CheckCollision();
		OutOfBounds();
	}

	private void CheckCollision()
	{
		_maxDistance = ballSizeRadius + _sizeRadius;

		for (int i = 0; i < balls.size(); ++i)
		{
			if (abs(pos.x - balls.get(i).pos.x) > _maxDistance || abs(pos.y - balls.get(i).pos.y) > _maxDistance)
				continue;
			else if (dist(pos.x, pos.y, balls.get(i).pos.x, balls.get(i).pos.y) > _maxDistance)
				continue;
			else
				player = null;
		}
	}

	void OutOfBounds()
	{
		if (pos.x < 0)
			pos.x = width - 1;
		else if (pos.x > width)
			pos.x = 1;
		else if (pos.y < 0)
			pos.y = height - 1;
		else if (pos.y > height)
			pos.y = 1;
	}
};