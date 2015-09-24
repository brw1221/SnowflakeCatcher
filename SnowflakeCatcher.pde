Snowflake [] many;
void setup()
{
  size(500,500);
  background(0);
  many = new Snowflake[100];
  for(int i=0; i<many.length; i++)
  {
    int x = (int)(Math.random()*500);
    int y = (int)(Math.random()*500);
    many[i] = new Snowflake();
  }
}
void draw()
{
  for(int i=0; i<many.length; i++)
  {
    many[i].erase();
    many[i].lookDown();
    many[i].move();
    many[i].wrap();
    many[i].show();
  }
}
void mouseDragged()
{
  noStroke();
  fill(135,206,235);
  ellipse(mouseX,mouseY,7,7);
  if(mousePressed && (mouseButton == RIGHT))
  {
    fill(0);
    ellipse(mouseX,mouseY,20,20);
  }
}


class Snowflake
{
  int x, y, z;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*500);
    y = (int)(Math.random()*500);
    z = 100;
    isMoving = true;
  }
  void show()
  {
   fill(255);
   ellipse(x,y,5,5);
  }
  void lookDown()
  {
    if(y>0 && y<500 && get(x,y+5)==color(135,206,235))
    {
      isMoving = false;
    }
    else
    {
      isMoving = true;
    } 
    
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,7,7);
  }
  void move()
  {
    if(isMoving == true)
    {
      y = y+1;
    }
  }
  void wrap()
  {
    if(y>498)
    {
      y = 0;
      x = (int)(Math.random()*500);
    }
  }
 
}


