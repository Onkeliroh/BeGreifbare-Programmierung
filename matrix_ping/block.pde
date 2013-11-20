import ddf.minim.*;
import ddf.minim.ugens.*;

class block{
  public int x,y,w,h;
  int trim = 3;
  color c = color (random(255),random(255),random(255));

//  Minim minim = new Minim(this);
  
  block(int x_tmp, int y_tmp, int w_tmp, int h_tmp)
  {
    x = x_tmp;
    y = y_tmp; 
    w = w_tmp;
    h = h_tmp;
  } 
  
  void draw_block()
  {
    fill(c);
    rect(x,y,w,h,trim);
    noFill(); 
  }
  
  void ping()
  {    
    // given start time, duration, and frequency
    out.playNote( 0.0, 0.01, x );
  }
}
