//04 - Input and Motion
//GP20
//Robin Vondrak
//https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/04%20-%20Input%20and%20Movement
//2020-09-XX

public Vector2 inputAxis = new Vector2(0,0);

void keyPressed()
{
  //Spara input i vector istället för bool
  if (keyCode == LEFT || key == 'a')
    inputAxis.SetX(-1);
  else if (keyCode == RIGHT || key == 'd')
    inputAxis.SetX(1);
  else if (keyCode == UP || key == 'w')
    inputAxis.SetY(-1);
  else if (keyCode == DOWN || key == 's')
    inputAxis.SetY(1);
  else if (key == 'g')
    gravity = !gravity;
 }

void keyReleased()
{
  //Spara input i vector istället för bool
  if (keyCode == LEFT || key == 'a')
    inputAxis.SetX(0);
  else if (keyCode == RIGHT || key == 'd')
    inputAxis.SetX(0);
  else if (keyCode == UP || key == 'w')
    inputAxis.SetY(0);
  else if (keyCode == DOWN || key == 's')
    inputAxis.SetY(0);
}