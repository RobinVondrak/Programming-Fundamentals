//06 - Class and Objects
//
//Ball Manager

public class BallManager
{
	private int _maxBalls = 100;

	void SpawnBall()
	{
		if (player == null || balls.size() >= _maxBalls)
			return;

		float distSize = ballSizeRadius * 2;
		balls.add(new Ball(ballSizeRadius, ballColor));

		PVector _spawnPos = new PVector(
			random(distSize, width - distSize),
			random(distSize, height - distSize));

		for (int y = 0; y < balls.size(); ++y)
		{
			float distance = abs(_spawnPos.dist(new PVector(balls.get(y).pos.x, balls.get(y).pos.y)));

			if (distance <= distSize)
			{
				_spawnPos = new PVector(
					random(distSize, width - distSize),
					random(distSize, height - distSize));
				y = 0;
			}
			else if ((y == balls.size() - 1) &&
				distance > distSize &&
				distance > abs(_spawnPos.dist(player.pos)))
			{
				balls.get(balls.size() - 1).pos = _spawnPos;
			}
		}
	}

	void UpdateBalls()
	{
		for (int i = 0; i < balls.size(); ++i)
			balls.get(i).Move();
	}
};