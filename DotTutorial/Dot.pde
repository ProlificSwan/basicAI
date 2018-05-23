class Dot
{
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  Goal finish;
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest;
  
  
  float fitness = 0;

  Dot(Goal fin)
  {
    brain = new Brain(400);
    pos = new PVector(width/2,height-10);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    finish = fin;
  }

  void show()
  {
    if(isBest)
    {
      fill(0,255,0);
      ellipse(pos.x,pos.y,8,8);
    }
    else
    {
      fill(0);
      ellipse(pos.x,pos.y,4,4);
    }
  }

  void move()
  {
    if(brain.directions.length > brain.step)
    {
      acc = brain.directions[brain.step];
      brain.step++;
    }
    else
    {
      dead = true; 
    }
    vel.add(acc);
    vel.limit(15);
    pos.add(vel);
  }

  void update()
  {
    if (!dead && !reachedGoal)
    {
      move();
      if(pos.x < 2 || pos.y < 2 || pos.x>width-2 || pos.y > height-2)
      {
        dead = true;
      }
      else if(dist(pos.x,pos.y,finish.pos.x,finish.pos.y) < 5)
      {
        reachedGoal = true;
      }
      else if((pos.x > 180 && pos.x < 860 && pos.y > 380  && pos.y < 400) ||
              (pos.x > 800 && pos.x < 1100 && pos.y > 500  && pos.y < 520) ||
              (pos.x > 0 && pos.x < 150 && pos.y > 200  && pos.y < 220) ||
              (pos.x > 630 && pos.x < 830 && pos.y > 70  && pos.y < 220) ||
              (pos.x > 450 && pos.x < 520 && pos.y > 0  && pos.y < 110)) //TODO move this to a standarized obstacle collision check
      {
        dead = true;        
      }
    }

  }

  void calculateFitness()
  {
    if(reachedGoal)
    {
      fitness = 1.0/16 + 10000/(float)(brain.step * brain.step);
    }
    else
    {
      float distanceToGoal = dist(pos.x, pos.y, finish.pos.x, finish.pos.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }
  
  
  
  //TODO mate this with another parent instead of asexual reproduction
  Dot createBaby()
  {
    Dot baby = new Dot(finish);
    baby.brain = brain.clone();
    return baby;
  }


}
