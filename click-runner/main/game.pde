color bg_color = color(255,255,255);
color bg_game_over = color (200,10,10);
color bg_game_victory = color (245,239,74);

int game_state = 0;
float speed = 1;
float speed_limit = 5;
float Click=millis();

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
    case 2 :
      game_victory();
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
  textAlign(CENTER);
  textSize(32);
  text(title,width/2,30);

  set_speed();
  println(speed + " " + Click);
  level_ini.draw_level();
  
  draw_speed_bar();
}

void exit_game()
{
  --state;
}

void game_over()
{
  fill(text_default_color);
  background(bg_game_over);
  textAlign(CENTER);
  textSize(40);
  text("FAILED",width/2,height/2);
}

void game_victory()
{
  fill(text_default_color);
  background(bg_game_victory);
  textAlign(CENTER);
  textSize(40);
  text("Victory!",width/2,height/2);
}

void set_speed()
{
  if ( speed < 1 )
  {
    speed=1; 
  }
  else if ( speed >= speed_limit )
  {
    speed = speed_limit;
  } 
  if ( millis() - Click <= 1000 )
  { 
     speed += 0.03;
  }
  if ( millis() - Click > 1000 )
  { 
    Click = 0;
    speed -= 0.025;    
  }
}

void draw_speed_bar()
{
  noStroke();
  fill(color(118,118,109));
  rect (20,50,300,10);
  fill(color(255,0,0));
  rect (20,50,(280/100)*(speed*20),10);
  noFill();
  
}
