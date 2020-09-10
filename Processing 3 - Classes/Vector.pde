//03 - Vectors Class extra
//GP20
//Robin Vondrak
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/03%20-%20Vectors
//2020-09-XX

class Vector2 {

	private float _x;
	private float _y;
	
	//---CONSTRUCTOR---
	Vector2 (float x, float y)
	{
		_x = x;
		_y = y;
	}
	//---SET X/Y---
	void Set(float x, float y)
	{
		_x = x;
		_y = y;
	}
	//---GET X/Y---
	float GetX()
	{
		return this._x;
	}
	float GetY()
	{
		return this._y;
	}
	//---ADDITION---
	void Add (float x, float y)
	{
		_x += x;
		_y += y;
	}
	void Add (Vector2 vec)
	{
		_x += vec.GetX();
		_y += vec.GetY();
	}
	//---SUBTRACT---
	void Sub (float x, float y)
	{
		_x -= x;
		_y -= y;
	}
	void Sub (Vector2 vec)
	{
		_x -= vec._x;
		_y -= vec._y;
	}
	//---MULTIPLY---
	void Multi(float multiply)
	{
		_x *= multiply;
		_y *= multiply;
	}
	void Multi(Vector2 vec)
	{
		_x *= vec._x;
		_y *= vec._x;
	}
	//---DIVIDE---
	void Div(Vector2 vec)
	{
		_x /= vec.GetX();
		_y /= vec.GetY();
	}
	void Div(float divide)
	{
		_x /= divide;
		_y /= divide;
	}
	//---MAGNITUDE---
	float GetMag()
	{
		return sqrt(_x*_x + _y*_y);
	}
	//---NORMALIZE---
	void Normie()
	{
		_x = norm(_x, 0, 1);
		_y = norm(_y, 0, 1);
	}
	//---ANGLE---
	float GetAngleDegrees()
	{
		return degrees((float)Math.atan2(_y,_x));
	}
	float GetAngleRadians()
	{
		return (float)Math.atan2(_y,_x);
	}
	void SetAngleDeg(float angleDeg)
	{
		float mag = this.GetMag();
		_x = acos(angleDeg) * mag; //arccos
		_y = asin(angleDeg) * mag; //arcsin
	}
	void SetAngleRad(float angleRad)
	{
		float mag = this.GetMag();
		_x = cos(angleRad) * mag; //cos v = närliggande katet/hypotenusa
		_y = sin(angleRad) * mag; //sin v = motstående katet/hypotenusa
	}
	//---TO STRING---
	String ToString()
	{
		return str(_x + ", " + _y);
	}
};