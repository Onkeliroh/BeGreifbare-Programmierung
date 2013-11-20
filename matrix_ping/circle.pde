class circle{

 public int x,y;
 public int r=0;
 public int heir = 0;
 float alpha = 200;
 float r_dec = 1;
 color circle_color = color (0,0,180);
 
 
 

  public circle(int x_tmp, int y_tmp)
  {
    stroke(circle_color);
    x = x_tmp;
    y = y_tmp;
    noStroke();
  }
  
  public circle(int x_tmp, int y_tmp, int h)
  {
    x = x_tmp;
    y = y_tmp;
    heir = h;
    r = 10;
    circle_color = color ((180*h)%255,(60*h)%255,(180*h)%255);
  }
  
  public void set_color(color c)
  {
    circle_color = c;
  }
  
  public void draw_circle()
  {
    noFill();
    float alpha_tmp = alpha;
    float r_tmp = r;
    while (alpha_tmp > 50)
    {
      stroke(circle_color,alpha);
      strokeWeight(1);
      ellipse(x,y,r_tmp,r_tmp);
      
      alpha_tmp = alpha_tmp - (alpha / 5);
      r_tmp -= r_dec;
    }
    r += 5;
    println(r);
  }

}
