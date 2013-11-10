void show_fps()
{
  textAlign(LEFT);
  textSize(9);
  fill(color(0,0,0));
  text("FPS: " + (int)frameRate,0,10); 
}

//x and y are meant to be the upper left corner
boolean is_rect_in_rect(float x_1, float y_1, float width_1, float x_2, float y_2, float width_2)
{
  return !(x_1 > x_2+width_2 || x_1+width_1 < x_2 || y_1 > y_2+width_2 || y_1+width_1 < y_2);
}

boolean is_rect_in_circle(float x_1, float y_1, float w_1, float x_2, float y_2, float radius)
{
  return !(x_2 + radius < x_1 || x_2 - radius > x_1 + w_1 || y_1 > y_2 + radius || y_1 + w_1 < y_2 - radius);
}

boolean is_rect_in_line (float x_1, float y_1, float w_1, float x_2, float y_2, float width_2)
{
  return !(x_1 < x_2 || x_1 + w_1 > x_2 || y_1 > y_2 || y_1 + w_1 < y_2);
}

