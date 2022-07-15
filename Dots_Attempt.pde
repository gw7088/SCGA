Population test;

// Variables to manipulate
int popSize = 200;

//OLD GOAL/////
PVector goal  = new PVector(760, 760);

//New goal
//PVector goal = new PVector(760, 400);

void setup()
{
  size(800, 800);
  frameRate(10000000);
  
  test = new Population(popSize);
  print("REGULAR GA:\n");
  print("Initial Population:\n");
}



void draw()
{
    background(0, 175, 255);
    
    //draw goal
    fill(255, 255, 0);
    //ellipse(goal.x, goal.y, 15, 15);
    
    //OLD GOAL///
    //rect(goal.x, goal.y, 15, 15);
    
    //New goal
    rect(goal.x, goal.y, 15, 15);
    
    //draw obstacle
    //fill(0, 0, 255);
    //rect(0, 200, 250, 10);

    
    if(test.allDotsDead())// && test.generation < 3)
    {
       // GA here
       test.calculateFitness();
       test.nextGeneration();
       //print("DOTS DEAD");
    }
    else
    {
      test.update();
      test.show();
      //print("MOVING DOTS");
    }
    
}
