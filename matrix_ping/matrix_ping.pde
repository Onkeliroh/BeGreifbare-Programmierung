import java.lang.Math;
import ddf.minim.*;
import ddf.minim.ugens.*;

// Life is colorful :P
// Daniel Pollack
// controlls:
//  Key: r = reset
//  Mousebutton: Left = draw Block
//  Mousebutton: Right = create 'Pulse'

Minim minim = new Minim(this);
AudioOutput out = minim.getLineOut();

color background_color = color (230,230,230);

int divisor_x = 40;
int divisor_y = 40;
int max_heir = 3;

ArrayList<circle> circle_array = new ArrayList<circle>();
ArrayList<block> block_array = new ArrayList<block>();

void setup()
{
  size(400,400); 
  frameRate(30);
  smooth(8);
}

void draw()
{
  background(background_color);
  
  for ( block b : block_array )
  {
    b.draw_block();
  }
  
  for ( circle circ : circle_array )
  {
      circ.draw_circle();
  }
  
  
  
  //checks for to big and therefor useless circles
  for (int i = 0; i < circle_array.size(); ++i)
  {
    circle circ = circle_array.get(i);
    if (((circ.x + circ.r) > (width*5) && (circ.y + circ.r) > (height*5)))
    {
      circle_array.remove(i);
      --i;
    }
  }  

  check_for_ping();  
}

void check_for_ping()
{
  for ( int i = 0 ; i < block_array.size() ; ++i )
    for ( int j = 0 ; j < circle_array.size() ; ++j )
    {
      //if ( is_rect_in_ellipse(block_array.get(i).x,block_array.get(i).y,block_array.get(i).w,block_array.get(i).h,circle_array.get(i).x,circle_array.get(i).y,circle_array.get(i).r) )
      if ( is_circle_in_ellipse(block_array.get(i).x,block_array.get(i).y,block_array.get(i).w,block_array.get(i).h,circle_array.get(j).x,circle_array.get(j).y,circle_array.get(j).r) )
      {
        block_array.get(i).ping();
        if ( circle_array.get(j).heir < max_heir )
          circle_array.add(new circle(block_array.get(i).x+divisor_x/2,block_array.get(i).y+divisor_y/2,++circle_array.get(j).heir));
      }
    }
}

void mouseClicked()
{
  if ( mouseButton == RIGHT )
  {
    circle_array.add(new circle(mouseX,mouseY));
  } 
  else if ( mouseButton == LEFT )
  {
    int x = floor((float) (mouseX / divisor_x)); 
    int y = floor((float) (mouseY / divisor_y));
    
    block_array.add( new block(x*divisor_x,y*divisor_y,divisor_x,divisor_y) );
  }
}

void keyPressed()
{
  if (key == 'r' )
  {
    circle_array.clear();
    block_array.clear();
  }
}
