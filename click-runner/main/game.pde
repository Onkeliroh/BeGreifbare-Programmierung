color bg_color = color(255,255,255);
color bg_game_over = color (200,10,10);

int game_state = 0;

level level_ini;

void run_game()
{
  switch (game_state)
  {
    case 0 :
      play();
      break;
    case 1 : 
      game_over();
      break;
    default : 
      exit_game();
  }
  
}

void init_game()
{
  level_ini = new level();
}

void play()
{
  background(bg_color);
  show_fps();
  
//  textAlign(CENTER);
//  textSize(40);
//  text("HELLO WORLD",width/2,height/2);

  level_ini.draw_level();
}

void exit_game()
{
  --state;
}

void game_over()
{
  background(bg_game_over);
  textAlign(CENTER);
  textSize(40);
  text("FAILED",width/2,height/2);
}




