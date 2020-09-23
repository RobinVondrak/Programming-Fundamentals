//06 - Class and Objects
//GP20
//Robin Vondrak
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/06%20-%20Class%20and%20Objects
//2020-09-23

//*****VARIBALS*****
//---GENERAL---
public BallManager ballManager = new BallManager();
public boolean restarting = true;

private final int FPS = 144;
private boolean isGameOver = true;
private String titleText = "06 - Class and Objects";
private String gameOverTitle = "You dead";
private String gameOverText = "Press R for restart";
private int titleGameOverSize = 50;
private int textGameOverSize = 40;
private color gameOverTextColor = #eb3636;
private color backgroundColor = #AD688F;
//---PLAYER---
private color playerColor = #6CBDB1;
private float playerSizeRadius = 15;
private float playerSpeed = 300;
private Player player = new Player(playerSizeRadius, playerColor, playerSpeed);
//---BALL---
public ArrayList<Ball> balls = new ArrayList<Ball>();
public float ballSizeRadius = 20;

private color ballColor = #76F76F;
private Ball ballTest = new Ball(ballSizeRadius, ballColor);
//---TIMER---
private Timer spawnTimer = new Timer(3000);

//-----FUNCTIONS-----
void setup()
{
	size(1080, 1080);
	frameRate(FPS);
	((java.awt.Canvas) surface.getNative()).requestFocus(); //Sätter fokus

	surface.setTitle(titleText);
	surface.setLocation(0,0);
	ellipseMode(CENTER);
	textAlign(CENTER);
}

void draw()
{
	Time.currentTime = millis();
	Time.deltaTime = (Time.currentTime - Time.time);
	Time.deltaTime *= Time.MULTI_DELTA;

	if (player == null || restarting)
	{
		if (restarting)
		{
			restarting = false;
			isGameOver = false;
			balls = new ArrayList<Ball>();
			player = new Player(playerSizeRadius, playerColor, playerSpeed);
			spawnTimer.Start();
			return;	
		}
		isGameOver = true;
	}

	background(backgroundColor);
	ballManager.UpdateBalls();

	if (player != null)
		player.Move();
	else
		spawnTimer.Stop();

	if (spawnTimer.Time())
		ballManager.SpawnBall();

	if (isGameOver)
		DrawGameOver();

	Time.time = Time.currentTime;
}

void DrawGameOver()
{
	fill(gameOverTextColor);
	textSize(titleGameOverSize);
	text(gameOverTitle, width / 2, (height / 2) - titleGameOverSize / 2);
	textSize(textGameOverSize);
	text(gameOverText, width / 2, (height / 2) + textGameOverSize / 2);
}