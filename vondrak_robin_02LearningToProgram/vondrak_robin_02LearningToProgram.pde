//02 - Learning to Program
//Robin Vondrak
//GP20
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/02%20-%20Learning%20to%20Program
//2020-09-09

private static final int FPS = 60;
private static int STROKE_WIDTH = 3;
private static int changeColorEvery = 3;

private static color backgroundColorStart = #a83252;
private static color backgroundColorEnd = #441852;
private static color strokeColor = #999999;
private static color blackColor = #000000;
private static float colorInt = 0;
private static float rgbSpeed = 0.1;
private static boolean colorInc = true;

private static int lines = 30;
private static int animationSpeed = 2;
private static int frame = 0;
private static PVector position = new PVector(540,540);
private static PVector PrblcCurveSize = new PVector(400, 400);

private static boolean inc = true;

void setup()
{
	size(1080, 1080);
	frameRate(FPS);
	strokeWeight(STROKE_WIDTH);
	colorMode(HSB, 100);
}

void draw()
{
	if (colorInc)
		colorInt += rgbSpeed;
	else
		colorInt -= rgbSpeed;

	strokeColor = color(colorInt, 80, 100); //Animering av färgen

	if (((position.y + (animationSpeed * frame) + PrblcCurveSize.y) > height)) //Animering av de paraboliska kurvorna
		inc = false;
	else if ((position.x + (animationSpeed * frame) + PrblcCurveSize.x) < PrblcCurveSize.x * 2)
		inc = true;	

	background(lerpColor(backgroundColorStart, backgroundColorEnd, colorInt / 100)); //Bakgrundens färg animation

	//De paraboliska kurvorna, 4st
	ParabolicCurve yeet = new ParabolicCurve(
		new PVector(PrblcCurveSize.x + (animationSpeed * frame) * -1, 0),
		new PVector(0, PrblcCurveSize.y + (animationSpeed * frame)),
		lines);
	//Rita ut kurvan
	yeet.DrawCurve(position);

	yeet = new ParabolicCurve(
		new PVector(PrblcCurveSize.x + (animationSpeed * frame) * -1, 0),
		new PVector(0, -PrblcCurveSize.y + (animationSpeed * frame) * -1),
		lines);

	yeet.DrawCurve(position);

	yeet = new ParabolicCurve(
		new PVector(-PrblcCurveSize.x + (animationSpeed * frame), 0),
		new PVector(0, -PrblcCurveSize.y + (animationSpeed * frame) * -1),
		lines);

	yeet.DrawCurve(position);

	yeet = new ParabolicCurve(
		new PVector(-PrblcCurveSize.x + (animationSpeed * frame), 0),
		new PVector(0, PrblcCurveSize.y + (animationSpeed * frame)),
		lines);

	yeet.DrawCurve(position);

	if (inc)
		frame++;
	else
		frame--;

	if (colorInt >= 100) //Färgens animation
		colorInc = false;
	else if (colorInt <= 0 )
		colorInc = true;
}


private class ParabolicCurve
{
	private PVector _xAxis, _yAxis;
	private int _numberOfLines;
	private float _lineSpaceX;
	private float _lineSpaceY;

	ParabolicCurve(PVector axis1, PVector axis2, int numberOfLines)
	{
		_xAxis = new PVector(axis1.x, axis1.y);
		_yAxis = new PVector(axis2.x, axis2.y);

		_numberOfLines = numberOfLines;

		_lineSpaceX = (_xAxis.x - _yAxis.x) / _numberOfLines;
		_lineSpaceY = (_yAxis.y - _xAxis.y) / _numberOfLines;
	}

	private void DrawCurve(PVector pos)
	{
		pos = new PVector(pos.x, pos.y - _yAxis.y); //Gör att hörnet blir center

		for (int i = 0; i < _numberOfLines + 1; ++i)
		{
			if ((i % changeColorEvery) == 0)
				stroke(blackColor);
			else
				stroke(strokeColor);

			line(pos.x, //x1
				pos.y + (i * _lineSpaceY), //y1
				pos.x + (i * _lineSpaceX), //x2
				pos.y + (_lineSpaceY * _numberOfLines)); //y2
		}
	}
}