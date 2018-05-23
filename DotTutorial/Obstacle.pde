class Obstacle
{
  PVector pos;
  PVector size;
  
  Obstacle(int posX, int posY, int sizeX, int sizeY)
  {
    pos = new PVector(posX,posY);
    size = new PVector(sizeX,sizeY);
  }
  
  void show()
  {
    fill(0,0,255);
    rect(pos.x,pos.y,size.x, size.y); 
  }
  
}
