//03 - Vectors extra
//GP20
//Robin Vondrak
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/03%20-%20Vectors
//2020-09-13
private static final int FPS = 60;
private static Vector2 mouseStartPos;
private static Vector2 mouseStopPos;
private static boolean isReleased = true;

private static float spaceFromSide = 0.75f; //%
static private Vector2 firstVec;
static private Vector2 secondVec;
private color backgroundColor = #70033F;
private color textColor = #1FAB6A;

private VectorTextTitle vectorTitle; //Behöver köras i setup för att få rätt värden
private static TextUI scoreUI;
private static TextUI scorePercentUI;
private static int distFromSide = 40;

private static int basePoints = 2500;
private int score = 0;
private float scorePercent = 0;
private int fontSize = 23;

void setup()
{
	size(1120, 630);
	frameRate(FPS);
	textSize(30);
	fill(textColor);
	stroke(255);

	vectorTitle = new VectorTextTitle();

	firstVec = new Vector2();
	secondVec = new Vector2();
	firstVec.Randomize(
		width - (width * spaceFromSide), width * spaceFromSide,
		height - (height * spaceFromSide), height * spaceFromSide);
	secondVec.Randomize(
		width - (width * spaceFromSide), width * spaceFromSide,
		height - (height * spaceFromSide), height * spaceFromSide);

	scoreUI = new TextUI(fontSize, new Vector2(distFromSide, distFromSide / 2));
	scorePercentUI = new TextUI(fontSize, new Vector2(width - distFromSide, distFromSide));
}

void draw()
{
	strokeWeight(2);
	background(backgroundColor);
	vectorTitle.DrawTitle(firstVec, secondVec);
	scoreUI.DrawText(str(score));
	textAlign(RIGHT);
	scorePercentUI.DrawText(String.format("%.1f", scorePercent) + "%");
	textAlign(CENTER);

	DrawInputVector();

	strokeWeight(10);
	point(firstVec.GetX(), firstVec.GetY()); //Prick där man ska sätta ut vektor
	point(secondVec.GetX(), secondVec.GetY()); //Prick där man ska sätta ut vektor
}

void mousePressed()
{
	if (mouseButton == LEFT && isReleased && mouseStartPos == null)
	{
		isReleased = false;
		mouseStartPos = new Vector2(mouseX, mouseY);
	} 
	else if(mouseButton == RIGHT && isReleased) //Återställer ritad vector
	{
		isReleased = false;
		mouseStartPos = null;
		mouseStopPos = null;
		if (scorePercent != 0)
		{
			scorePercent = 0;
			NewVector();
		}
	}
	else if (mouseButton == LEFT && isReleased && mouseStartPos != null && mouseStopPos == null)
	{
		mouseStopPos = new Vector2(mouseX, mouseY);
		UpdateScore(mouseStartPos, mouseStopPos);
	}
}

void mouseReleased()
{
	isReleased = true;
}

void DrawInputVector()
{
	if (mouseStartPos != null)
	{
		if (mouseStopPos == null)
		{
			mouseStopPos = new Vector2(mouseX, mouseY);

			triangle(mouseStartPos.GetX(),
				mouseStartPos.GetY(),
				mouseStopPos.GetX(),
				mouseStartPos.GetY(),
				mouseStopPos.GetX(),
				mouseStopPos.GetY());

			mouseStopPos = null;

			return;
		}

		triangle(mouseStartPos.GetX(),
			mouseStartPos.GetY(),
			mouseStopPos.GetX(),
			mouseStartPos.GetY(),
			mouseStopPos.GetX(),
			mouseStopPos.GetY());
	}
}

void UpdateScore(Vector2 vec1, Vector2 vec2)
{
	float _xPoint1 = abs((firstVec.GetX() - vec1.GetX()) / firstVec.GetX());
	float _yPoint1 = abs((firstVec.GetY() - vec1.GetY()) / firstVec.GetY());
	float _xPoint2 = abs((secondVec.GetX() - vec2.GetX()) / secondVec.GetX());
	float _yPoint2 = abs((secondVec.GetY() - vec2.GetY()) / secondVec.GetY());

	float percent = abs(((( _xPoint1 + _yPoint1 + _xPoint2 + _yPoint2) / 4) - 1));
	scorePercent = percent * 100;
	score += basePoints * percent;
}

void NewVector()
{
	firstVec.Randomize(
		width - (width * spaceFromSide), width * spaceFromSide,
		height - (height * spaceFromSide), height * spaceFromSide);
	secondVec.Randomize(
		width - (width * spaceFromSide), width * spaceFromSide,
		height - (height * spaceFromSide), height * spaceFromSide);
}

private class VectorTextTitle //Kan ej vara static https://stackoverflow.com/questions/9744639/must-qualify-the-allocation-with-an-enclosing-instance-of-type-geolocation
{
	private int _textSize = 30;
	private int _spaceing = _textSize * 3;
	private Vector2 _textPos;

	VectorTextTitle()
	{
		_textPos = new Vector2(width / 2, _spaceing / 2);
	}

	void DrawTitle(Vector2 vec, Vector2 vec2)
	{
		textAlign(CENTER, CENTER);
		text((vec.ToString(int.class)) + " : " + (vec2.ToString(int.class)),
			_textPos.GetX(), _textPos.GetY());
	}
};

private class TextUI
{
	private int _textSize;
	private Vector2 _textPos;

	TextUI(int tSize, Vector2 tPos)
	{
		_textSize = tSize;
		_textPos = tPos;
	}

	void DrawText(String text)
	{
		text(text, _textPos.GetX(), _textPos.GetY());
	}
};
