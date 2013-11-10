class level
{
  figure fig;
  int floor_y = (height/3)*2;
  float shift_x = width;
  obstacle[] obstacles = {
    new obstacle(0,floor_y,10,'r'),
    new obstacle(200,floor_y,10,'t'),
    new obstacle(400,floor_y,10,'l'),
    new obstacle(600,floor_y,20,'r'),
    new obstacle(900,floor_y,25,'r'),
    new obstacle(1150,floor_y,10,'t'),
    new obstacle(1160,floor_y,20,'r'),
    new obstacle(1400,floor_y,10,'f'),
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
      check_collision(o);
    } 
    popMatrix();
    shift_x -= speed;
  }
  
  void check_collision(obstacle o)
  {
    switch (o.get_form())
    {
      case 'r':
        if (is_rect_in_rect(fig.get_posX(),fig.get_posY(),fig.get_weight(),o.get_posX()+shift_x,o.get_posY(),o.get_weight())) game_state = 1;
        break;
      case 't':
        if (is_rect_in_triangle(fig.get_posX(),fig.get_posY(),fig.get_weight(),o.get_posX()+shift_x,o.get_posY(),o.get_weight())) game_state = 1;
        break;
      case 'l':
        if (is_rect_in_line(fig.get_posX(),fig.get_posY(),fig.get_weight(),o.get_posX()+shift_x,o.get_posY(),o.get_weight())) game_state = 1;
        break;
      case 'f': 
        if (o.get_posX()+shift_x < fig.get_posX()) game_state = 2;
        break;
    }
  }
}
