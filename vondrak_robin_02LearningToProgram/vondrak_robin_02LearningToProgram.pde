
private static final int FPS = 120;
private static color backgroundColor = #4470AD;
private static color greyColor = #999999;
private static color blackColor = #000000;
private static int STROKE_WIDTH = 3;
private static int changeColorEvery = 3;
private static final int LINE_SPACE = 50;
//private static int numberOfLines;

void setup()
{
	size(1080, 1080);
	frameRate(FPS);
  //	numberOfLines = width / LINE_SPACE; //Förutsatt att width & height är detsamma
  background(backgroundColor);
  stroke(greyColor);
  strokeWeight(STROKE_WIDTH);
}

void draw()
{
	background(backgroundColor);
	ParabolicCurve yeet = new ParabolicCurve(new PVector(400,0),new PVector(0,400), 30);
	yeet.DrawCurve(new PVector(200,200));
	yeet = new ParabolicCurve(new PVector(400,0),new PVector(0,-400), 30);
	yeet.DrawCurve(new PVector(200,200 + 800));
}

void DrawLines()
{
//for (int i = 1; i < _numberOfLines + 1; ++i)
	//	{
			//if (((lineSpace * i) % changeColorEvery) == 0)
			//	stroke(blackColor);
			//else
			//	stroke(greyColor);

			//line(0, i * _lineSpace, i * _lineSpace, height);
	//	}
}

private class ParabolicCurve //Lägg till flip funktion
{
	private PVector _xAxis, _yAxis;
	private int _numberOfLines;
	private float _lineSpaceX;
	private float _lineSpaceY;

	ParabolicCurve(PVector axis1, PVector axis2, int numberOfLines)
	{
		_xAxis = axis1;
		_yAxis = axis2;
		_numberOfLines = numberOfLines;

		_lineSpaceX = (_xAxis.x - _yAxis.x) / _numberOfLines;
		_lineSpaceY = (_yAxis.y - _xAxis.y) / _numberOfLines;
	}

	private void DrawCurve(PVector pos)
	{
		for (int i = 0; i < _numberOfLines; ++i)
		{
			line(pos.x, //x1
				pos.y + (i * _lineSpaceY), //y1
				pos.x + (i * _lineSpaceX),
				pos.y + (_lineSpaceY * _numberOfLines));
		}
	}
}
