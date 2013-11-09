float angle = 0;

color c;

void setup()
{
  size(600,500,P3D);
  frameRate(30);
  camera(width/2,height/2,100,0,0,0,0,1,0);
  c = color(random(255),random(255),random(255));
}

void draw()
{
  background(0);
  lights();
  
  pushMatrix();
  rotate(-angle);
  translate(100,0,0);
  fill(0,125,0);
  noStroke();
  sphere(50);
  popMatrix();
  
  pushMatrix();
  rotate(angle);
  translate(100,40,0);
  rotate(-angle);
  fill(c);
  box(50);
  popMatrix();
  
  
  
  angle += 0.01;
  
}

void draw_sun()
{
  pushMatrix();
    translate(0,0,0);
    sphere(10);
  popMatrix();
  
