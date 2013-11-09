class figure
{
  int posX;
  int posY;
  int weight;
  
  boolean jumping = false;
  int jump_count = 90;
  int jump_frame = 0;
  
  color fig_color;
  
  figure(int x, int y)
  {
    posX = x;
    posY = y;
    weight = 20;
    fig_color = color(25,252,25);
  }
  
  void draw_fig()
  {
    fill(fig_color);
    noStroke();
    if ( !jumping ) 
    {
      rect(posX-(weight/2),posY-(weight/2),weight,weight);
    }
    else
    {
      if (jump_frame >= jump_count/2)
        rect(posX-(weight/2),posY-(weight/2)-(jump_count-jump_frame),weight,weight);
      else
        rect(posX-(weight/2),posY-(weight/2)-(jump_frame),weight,weight);
      
        
       if ( jump_frame == jump_count )
       { 
          jumping = false;
          jump_frame = 0;
       }
       ++jump_frame;
    }
  }
}
