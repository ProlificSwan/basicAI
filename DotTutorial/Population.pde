class Population
{
  Dot[] dots;
  Goal finish;
  float fitnessSum;
  int generation = 1;
  
  int bestDot;
  
  int minStep = 400;
  
  Population(int size, Goal fin)
  {
    finish = fin;
    dots = new Dot[size];
    for(int i = 0; i < size; i++)
    {
      dots[i] = new Dot(fin);      
    }
  }
  
  
  void show()
  {
    for(int i = 0; i<dots.length; i++)
    {
      dots[i].show(); 
    }
  }  
  
  void update()
  {
    for(int i = 0; i<dots.length; i++)
    {
      if(dots[i].brain.step > minStep)
      {
        dots[i].dead = true;
      }
      else
      {
        dots[i].update();
      }
    }
  }  
  
   void calculateFitness()
  {
    for(int i = 0; i<dots.length; i++)
    {
      dots[i].calculateFitness(); 
    }
  }
  
  boolean allDotsDead()
  {
    for(int i = 0; i<dots.length; i++)
    {
      if(!dots[i].dead && !dots[i].reachedGoal)
      {
        return false;                
      }
    }
    return true;
  }
  
  void naturalSelection()
  {
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    calculateFitnessSum();
    Dot parent;
    
    newDots[0] = dots[bestDot].createBaby();
    newDots[0].isBest = true;
    for (int i = 1; i < dots.length; i++)
    {
      //select fit parents
      parent = selectParent();
      
      //get baby
      newDots[i] = parent.createBaby();
    }
    
    dots = newDots.clone();
    generation++;
  }
  
  void calculateFitnessSum()
  {
    fitnessSum = 0;
    for(int i = 0; i<dots.length; i++)
    {
      fitnessSum += dots[i].fitness; 
    }
  }
  
  Dot selectParent()
  {
    float rand = random(fitnessSum);
    
    float runningSum = 0;
    for(int i = 0; i<dots.length; i++)
    {
      runningSum += dots[i].fitness;
      if (runningSum > rand)
      {
        return dots[i];        
      }
    }
    
    return null; //should never get here.
  }
  
  void mutateDots()
  {
    for(int i = 1; i<dots.length; i++)
    {
      dots[i].brain.mutate();
    }
  }
  
  void setBestDot()
  {
    float max = 0;
    int maxIndex = 0;
    for(int i = 0; i<dots.length; i++)
    {
      if(dots[i].fitness > max)
      {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDot = maxIndex;
    
    if(dots[bestDot].reachedGoal)
    {
      minStep = dots[bestDot].brain.step;
      println("step:",minStep, " Gen: ",generation);
    }
    else
    {
      println("generation ", generation, " failure."); 
    }
  }
}
