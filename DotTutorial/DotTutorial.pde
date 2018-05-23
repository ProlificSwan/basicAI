Population test;
Goal goal;
Obstacle obs, obs2, obs3, obs4, obs5;

void setup()
{
  size(1200,800);
  
  goal = new Goal(600,10);
  obs = new Obstacle(180,380,680,20);
  obs2 = new Obstacle(800,500,300,20);
  obs3 = new Obstacle(0,200,150,20);
  obs4 = new Obstacle(630,70,200,150);
  obs5 = new Obstacle(450,0,70,110);
  test = new Population(1000, goal);
}

void draw()
{
  background(255);
  goal.show();
  obs.show();
  obs2.show();
  obs3.show();
  obs4.show();
  obs5.show();
  if (test.allDotsDead())
  {
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDots();
  }
  else
  {
    test.update();
    test.show();
  }
}
