class figure
{
  int posX;
  int posY;
  int current_posY;
  int weight;
  
  boolean jumping = false;
  int jump_count = 180;
  int jump_frame = 0;
  
  color fig_color;
  
  figure(int x, int y)
  {
    posX = x;
    posY = y;
    current_posY = y;
    weight = 20;
    fig_color = color(25,252,25);
  }
  
  void draw_fig()
  {
    fill(fig_color);
    noStroke();
    if ( !jumping ) 
    {
      rect(posX,posY,-weight,-weight);
      current_posY = posY;
    }
    else
    {
      if (jump_frame >= jump_count/2)
      {
        rect(posX,posY-(jump_count-jump_frame),-weight,-weight);
        current_posY = posY-(jump_count-jump_frame);
      }
      else
      {
        rect(posX,posY-(jump_frame),-weight,-weight);
        current_posY = posY-jump_frame;
      }
      
        
       if ( jump_frame == jump_count )
       { 
          jumping = false;
          jump_frame = 0;
          current_posY = posY;
       }
       jump_frame += 2;
    }
  }
  
  int get_posX()
  {
    return posX - weight;
  }
  
  int get_posY()
  {
    return current_posY;
  }
  
  int get_weight()
  {
    return weight;
  }
}
