//01 - Fundamentals
//Robin Vondrak
//gp20
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/01%20-%20Fundamentals
//2020-09-07

private static final int FRAME_RATE = 60;
private static final float TOP_SPEED = 2, BOTTOM_SPEED = 1;
private static final float SPACEING = 72;
private static color textColor = #337D8F;
private static PVector speed = new PVector(0, 0); //Hastigheten
private static PVector moveTo = new PVector(334, 216); //Startar i center
private static PVector position = new PVector(0,0); //Nuvarande psitionen av namnet
private static PVector nameSize = new PVector(378, 160); //Bredd och höjd på namnet

private static final float LEFT_SIDE_X = 0, RIGHT_SIDE_X = 378, TOP_SIDE_Y = 160, BOTTOM_SIDE_Y = 432; //Sidornas kordinater
private static int sidesToCheck = 0; // 1 = left, top | 2 = left, bottom | 3 = right, top | 4 = right, buttom
private static int lastSides = 1337;

void setup()
{
	size(768 , 432);
	frameRate(FRAME_RATE);
	colorMode(HSB, 360, 100, 100);
	UpdateSpeed(new PVector(1,1));
}

void draw()
{
	background(0, 0, 0);
	position = moveTo;
	moveTo = new PVector(moveTo.x + speed.x, moveTo.y + speed.y);
	DrawName(moveTo,textColor);
	CheckCollision();
}

void UpdateSpeed(PVector direction)
{
	if (sidesToCheck == lastSides)
	{
		sidesToCheck = 0;
		return;
	}

	PVector _dir = new PVector(1,1); //Ser till att dir blir rätt då y-dir är baserat på x-dir

	if (direction.x == (-1))
	{
		if (speed.y < 0)
			_dir.y = (-1);
		if (speed.x > 0)
			_dir.x = (-1);	
	}
	else if (direction.y == (-1))
	{
		if (speed.x < 0)
			_dir.x = (-1);	
		if (speed.y > 0)
			_dir.y = (-1);	
	}

	speed = new PVector(random(BOTTOM_SPEED , TOP_SPEED),0);
	speed = new PVector(speed.x * _dir.x, (speed.x * (float(height) / float(width))) * _dir.y * random(1, 3)); //x-speed * (height / width) = y-speed

	textColor = color(random(0f, 359f),100f,100f); //Slumpmässig färg
	lastSides = sidesToCheck;
	sidesToCheck = 0; //Kolla på nytt
}

void CheckCollision()
{
	if (sidesToCheck == 0)
	{
		if (speed.x < 0) //Vänster
		{
			if (speed.y < 0)//Upp
				sidesToCheck = 1;
			else //Ner
				sidesToCheck = 2;

		}
		else //Höger
		{
			if (speed.y < 0) //Upp
				sidesToCheck = 3;
			else //Ner
				sidesToCheck = 4;
		}
	}

	if (sidesToCheck == 1)	//1 = left, top
	{
		if (position.x <= LEFT_SIDE_X)
			UpdateSpeed(new PVector(-1, 1));
		else if (position.y <= TOP_SIDE_Y)
			UpdateSpeed(new PVector(1, -1));
	}
	else if (sidesToCheck == 2) //2 = left, bottom
	{
		if (position.x <= LEFT_SIDE_X)
			UpdateSpeed(new PVector(-1, 1));
		else if (position.y >= BOTTOM_SIDE_Y)
			UpdateSpeed(new PVector(1, -1));
	}
	else if (sidesToCheck == 3) //3 = right, top
	{
		if (position.x >= RIGHT_SIDE_X)
			UpdateSpeed(new PVector(-1, 1));
		else if (position.y <= TOP_SIDE_Y)
			UpdateSpeed(new PVector(1, -1));
	}
	else if (sidesToCheck == 4) //4 = right, buttom
	{
		if (position.x >= RIGHT_SIDE_X)
			UpdateSpeed(new PVector(-1, 1));
		else if (position.y >= BOTTOM_SIDE_Y)
			UpdateSpeed(new PVector(1, -1));	
	}
}

void DrawName(PVector drawAt, color letterColor)
{
	PVector _offset = new PVector(drawAt.x,drawAt.y);
	
	DrawLetterR(_offset, letterColor);
	_offset.x = _offset.x + SPACEING;

	DrawLetterO(_offset);
	_offset.x = _offset.x + SPACEING;

	DrawLetterB(_offset);
	_offset.x = _offset.x + SPACEING;

	DrawLetterI(_offset);
	_offset.x = _offset.x + SPACEING;

	DrawLetterN(_offset);
}

void DrawLetterR(PVector drawAt, color letterColor)
{
	color _letterColor = letterColor;
	float _strokeSize = 6f;

	float[][] _offset =
	{
		{0,0,0,160},	//Line
		{0,120,80,80,-PI/2,PI/2},	//Arc
		{20,80,60,0}	//Line
	};

	stroke(_letterColor);
	strokeWeight(_strokeSize);

	int i = 0;

	line(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		drawAt.x + _offset[i][2],
		drawAt.y - _offset[i][3]);
	i += 1;

	noFill();
	arc(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		_offset[i][2], //Storlek
		_offset[i][3], //Storlek
		_offset[i][4], //Arc start
		_offset[i][5]); //Arc stop
	i += 1;

	line(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		drawAt.x + _offset[i][2],
		drawAt.y - _offset[i][3]);
}

void DrawLetterO(PVector drawAt)
{
	float[] _offset = {
		30, //x
		80, //y
		60, //bredd
		160 //höjd
	};

	ellipse(
		drawAt.x + _offset[0],
		drawAt.y - _offset[1],
		_offset[2],
		_offset[3]);
}

void DrawLetterB(PVector drawAt)
{
	float[][] _offset =
	{
		{0,0,0,160},	//Line
		{0,125,70,70,-PI/2,PI/2},	//Arc
		{0,45,90,90,-PI/2,PI/2}	//Arc
	};

	int i = 0;

	line(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		drawAt.x + _offset[i][2],
		drawAt.y - _offset[i][3]);
	i += 1;

	noFill();
	arc(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		_offset[i][2], //Storlek
		_offset[i][3], //Storlek
		_offset[i][4], //Arc start
		_offset[i][5]); //Arc stop
	i += 1;

	arc(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		_offset[i][2], //Storlek
		_offset[i][3], //Storlek
		_offset[i][4], //Arc start
		_offset[i][5]); //Arc stop
}

void DrawLetterI(PVector drawAt)
{
	float[][] _offset =
	{
		{5,0,10,110},	//Rect
		{10,140,20,20}	//Circle
	};

	int i = 0;

	rect(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		_offset[i][2],
		-_offset[i][3]);
	i += 1;

	circle(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		_offset[i][2]);
}

void DrawLetterN(PVector drawAt)
{
	float _strokeSize = 8f;
	strokeWeight(_strokeSize);
	float[][] _offset =
	{
		{0,0,0,130},	//Line
		{0,130,90,0},	//Line
		{90,0,90,130}	//Line
	};

	int i = 0;

	line(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		drawAt.x + _offset[i][2],
		drawAt.y - _offset[i][3]);
	i += 1;
	line(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		drawAt.x + _offset[i][2],
		drawAt.y - _offset[i][3]);
	i += 1;
	line(
		drawAt.x + _offset[i][0],
		drawAt.y - _offset[i][1],
		drawAt.x + _offset[i][2],
		drawAt.y - _offset[i][3]);
}