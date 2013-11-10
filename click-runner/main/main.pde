//Global

int state = 0;
String title = "Click Runner";

boolean rectOver = false;
color rect_click_color = color(186,242,239);
color rect_default_color = color(252,227,227);
color rect_current_color = rect_default_color;
color text_default_color = color(0,0,0);

color mouse_over_color = color(206,187,187); 


void setup()
{
  size(600,400);
  smooth(2);
}

void draw()
{
  switch (state)
  {
    case 0:
      init_menu();
      break;
    case 1:
      run_game();
      break;      
    default: init_game();
  }
}

void init_menu()
{
  background(color(113,89,89));
  fill(text_default_color);
  textSize(32);
  textAlign(CENTER);
  text(title,width/2,50);
  
  
  int rectX = (width/2) -100;
  int rectY = (height/2) -25;
  int rectWidth = 200;
  int rectHeight = 50;
  
  if (rectOver_check(rectX,rectY,rectWidth,rectHeight)) 
  {
    rect_current_color = mouse_over_color;
  }
  else
  {
    rect_current_color = rect_default_color;
  }
  
  fill(rect_current_color);
  rect(rectX,rectY,rectWidth,rectHeight,5);  
  
  textSize(20);
  fill(text_default_color);
  text("START",width/2,height/2+10);
}

boolean rectOver_check(int x, int y, int w, int h)
{
    if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) 
    {
      rectOver = true;
      return true;
    }
    rectOver = false;
    return false;
}

void mousePressed()
{
  if (rectOver && state == 0)
  {  
    println("CLICK");  
    ++state;
    rectOver = false;
    init_game();
  }
  else if (mouseButton == LEFT && state == 1)
  {
    println("Run");
    Click = millis();
  }
  else if (mouseButton == RIGHT && state == 1)
  {
    //println("Jump");
    level_ini.fig.jumping = true;
  }  
}


