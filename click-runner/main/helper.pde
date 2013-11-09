void show_fps()
{
  textAlign(LEFT);
  textSize(9);
  fill(color(0,0,0));
  text("FPS: " + (int)frameRate,0,10); 
}
