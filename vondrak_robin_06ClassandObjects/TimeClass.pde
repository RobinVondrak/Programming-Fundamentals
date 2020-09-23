//06 - Class and Objects
//
//Delta time

public static class Time
{
	static public float deltaTime;
	static public long time;
	static public long currentTime;
	static public final float MULTI_DELTA = 0.001f;
};

public class Timer
{
	private int _waitTime;
	private long _timerStart;
	private boolean _timerActive = false;

	public Timer(int waitTime)
	{
		_waitTime = waitTime;
	}

	public void Start()
	{
		if (_timerActive)
			return;

		_timerActive = true;
		_timerStart = millis();
	}

	public void Stop()
	{
		if (!_timerActive)
			return;

		_timerActive = false;
	}

	public boolean Time()
	{
		if (_timerActive && (_waitTime <= (Time.currentTime - _timerStart)))
		{
			_timerStart = millis();
			return true;
		}
		else
		{
			return false;
		}
	}
};