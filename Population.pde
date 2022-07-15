class Population
{  
  Dot[] dots; 
  
  int generation = 1;
  
  // Variables to manipulate
  int popSize = 200;
  float mRate = .025;
  int genomeSize = 650;


  int minStep = genomeSize;
  float fitnessSum;
  
  
  Population(int size)
  {
    dots = new Dot[size];
    popSize = size;

    for (int i = 0; i < size; i++)
    {
      dots[i] = new Dot();
    }
  }


  void update()
  {
    for (int i = 0; i < dots.length; i++)
    {
      if (dots[i].genome.step > minStep) // 1000
      {
        dots[i].isDead = true;
      }
      dots[i].update();
    }
  }



  void show()
  {
    for (int i = 1; i < dots.length; i++)
    {
      dots[i].show();
    }
    dots[0].show();
  }



  boolean allDotsDead() 
  {
    for (int i = 0; i< dots.length; i++) 
    {
      if (!dots[i].isDead) 
      { 
        return false;
      }
    }
    return true;
  }



  void calculateFitness()
  {
    for (int i = 0; i < dots.length; i++)
    {
      dots[i].calculateFitness();
    }
    calculateFitnessSum();
  }



  void calculateFitnessSum()
  {
    fitnessSum = 0;
    for (int i = 0; i< dots.length; i++)
    {
      fitnessSum = fitnessSum + dots[i].fitness;
      //print("Fitness "+dots[i].fitness);
    }
    //print(" "+fitnessSum+"\n");

    //Normalizing 0-1
    for (int i = 0; i < dots.length; i++)
    {
      dots[i].fitness = (dots[i].fitness / fitnessSum);
      
      //print("Fitness " + dots[i].fitness);
    }
  }



  void nextGeneration()
  {
    print("\n");
    print("Gen Count: "+generation+"\n");
    
    setMinStep();
    
    Dot[] newDots = new Dot[popSize];
    
    for (int i = 0; i < dots.length/2; i++)
    {
      Dot parentA = selectParent();
      Dot parentB = selectParent();
      
      while (parentA == parentB)
      {
         //print("same\n");
         parentB = selectParent(); 
      }

      int cloneOne[] = new int[genomeSize];
      int cloneTwo[] = new int[genomeSize];

      //////////////Child A//////////////////////////////////////
      
      /**
      for (int j = 0; j < 36; j++)
      {
        cloneOne[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 2nd FIFTH PARENT B
      for (int j = 36; j < 72; j++)
      {
        cloneOne[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 3rd FIFTH PARENT B
      for (int j = 72; j < 108; j++)
      {
        cloneOne[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 4th FIFTH PARENT B
      for (int j = 108; j < 144; j++)
      {
        cloneOne[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 5th FIFTH PARENT B
      for (int j = 144; j < genomeSize; j++)
      {
        cloneOne[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }
      
      // CHILD ONE 1st FIFTH PARENT B
      for (int j = 0; j < 36; j++)
      {
        cloneTwo[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 2nd FIFTH PARENT A
      for (int j = 36; j < 72; j++)
      {
        cloneTwo[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 3rd FIFTH PARENT B
      for (int j = 72; j < 108; j++)
      {
        cloneTwo[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 4th FIFTH PARENT A
      for (int j = 108; j < 144; j++)
      {
        cloneTwo[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 5th FIFTH PARENT B
      for (int j = 144; j < genomeSize; j++)
      {
        cloneTwo[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }
      */

      
      // CHILD ONE 1st FIFTH PARENT A
      for (int j = 0; j < genomeSize*(1/5); j++)
      {
        cloneOne[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 2nd FIFTH PARENT B
      for (int j = genomeSize*(1/5); j < genomeSize*(2/5); j++)
      {
        cloneOne[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 3rd FIFTH PARENT B
      for (int j = genomeSize*(2/5); j < genomeSize*(3/5); j++)
      {
        cloneOne[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 4th FIFTH PARENT B
      for (int j = genomeSize*(3/5); j < genomeSize*(4/5); j++)
      {
        cloneOne[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 5th FIFTH PARENT B
      for (int j = genomeSize*(4/5); j < genomeSize; j++)
      {
        cloneOne[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      //////////////Child B/////////////////////////////////////

      // CHILD ONE 1st FIFTH PARENT B
      for (int j = 0; j < genomeSize*(1/5); j++)
      {
        cloneTwo[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 2nd FIFTH PARENT A
      for (int j = genomeSize*(1/5); j < genomeSize*(2/5); j++)
      {
        cloneTwo[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 3rd FIFTH PARENT B
      for (int j = genomeSize*(2/5); j < genomeSize*(3/5); j++)
      {
        cloneTwo[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 4th FIFTH PARENT A
      for (int j = genomeSize*(3/5); j < genomeSize*(4/5); j++)
      {
        cloneTwo[j] = parentA.genome.directions[j];
        //print(j+"\n");
      }

      // CHILD ONE 5th FIFTH PARENT B
      for (int j = genomeSize*(4/5); j < genomeSize; j++)
      {
        cloneTwo[j] = parentB.genome.directions[j];
        //print(j+"\n");
      }
      

      Dot childA = new Dot();
      Dot childB = new Dot();

      childA.genome.directions = cloneOne.clone();
      childB.genome.directions = cloneTwo.clone();



      // MUTATE CHILDREN
      for (int s = 0; s < genomeSize; s++)
      {
        float ran = random(0, 1);
        if (ran <= mRate)
        {
          int fRan = (int) floor(random(1, 9));
          childA.genome.directions[s] = fRan;
        }

        ran = random(0, 1);
        if (ran <= mRate)
        {
          int sRan = (int) floor(random(1, 9));
          childB.genome.directions[s] = sRan;
        }
      } 

      newDots[(2*i)] = childA;
      newDots[(2*i)+1] = childB;   
      
      //print(i+"\n");
    }

    dots = newDots.clone();

    // SHOW NEW POP + DIRECTIONS FOR EACH
    for (int i = 0; i < 500; i++)
    {
      //print("\n");
      //print(i + ":" + dots[i]+"\n");
      for (int j = 0; j < 1000; j++)
      {
        //print(dots[i].genome.directions[j]);
      }
    }
    generation++;
  }


  Dot selectParent()
  {
    int i = 0;
    while(i < 10000000)
    { 
       int indiv = floor(random(0, popSize));
       float indivFit = dots[indiv].fitness;
       float rand = random(1);//fitnessSum
     
       if(indivFit+.00015 > rand || indivFit-.00015 > rand)
       {

         return dots[indiv];
       }
       else
       {
         i++;
       }
     }

    return null; // Shouldnt do this
  }
  
  void setMinStep()
  {
     int currentMinStep = genomeSize;
     for(int i = 0; i < dots.length; i++)
     {
        if(dots[i].reachedGoal == true)
        {
          currentMinStep = dots[i].genome.step;
          
          if(minStep > currentMinStep)
          {
             minStep = currentMinStep;
          }
        }   
     }
     print("MinStep: "+minStep);
  }
}
