class level
{
  figure fig;
  int floor_y = (height/3)*2;
  float shift_x = width;
  obstacle[] obstacles = {
    new obstacle(0,floor_y,10,'r'),
    new obstacle(200,floor_y,10,'t'),
    new obstacle(400,floor_y,10,'l')
  };
  
  level()
  {
    fig = new figure(width/3,floor_y);
  }
  
  void draw_level()
  {
    fig.draw_fig();
    stroke(8);
    line(0,floor_y,width,floor_y);
    
    noFill();
    pushMatrix();
    translate(shift_x,0);
    for ( obstacle o : obstacles )
    {
      o.draw_obstacle();
    } 
    popMatrix();
    shift_x -= speed;
  }
}
