public class Dot
{ 
   PVector pos;
   public Genome genome;
   
   // Variable to manipulate
   
   // Good for corner
   public int genomeSize = 650;
   
   //New for goal
   //public int genomeSize = 150;
   
   boolean isDead = false;
   boolean reachedGoal = false;
   
   float fitness = 0;
   
   int numberOfSteps = 4;
   
   Dot()
   {
     genome = new Genome(genomeSize);
     pos = new PVector(400, 400);
   }  
   
   
   
   void show()
   {
    fill(0, 0, 0);
    ellipse(pos.x, pos.y, 4, 4);  
   }
   
   
   
   void move()
   {
     if(genome.directions.length > genome.step)
     {
       // North
       if(genome.directions[genome.step] == 1)
       {
         pos.y = pos.y - numberOfSteps;
         genome.step++;
       }
       // East
       else if(genome.directions[genome.step] == 2)
       {
         pos.x = pos.x + numberOfSteps;
         genome.step++;
       }
       // South
       else if(genome.directions[genome.step] == 3)
       {
         pos.y = pos.y + numberOfSteps;
         genome.step++;
       }
       // West
       else if(genome.directions[genome.step] == 4)
       {
         pos.x = pos.x - numberOfSteps;
         genome.step++;
       }
       // North East
       else if(genome.directions[genome.step] == 5)
       {
         pos.x = pos.x + numberOfSteps;
         pos.y = pos.y - numberOfSteps;
         genome.step++;
       }
       // South East
       else if(genome.directions[genome.step] == 6)
       {
         pos.x = pos.x + numberOfSteps;
         pos.y = pos.y + numberOfSteps;
         genome.step++;
       }
       // South West
       else if(genome.directions[genome.step] == 7)
       {
         pos.x = pos.x - numberOfSteps;
         pos.y = pos.y + numberOfSteps;
         genome.step++;
       }
       // North West
       else if(genome.directions[genome.step] == 8)
       {
         pos.x = pos.x - numberOfSteps;
         pos.y = pos.y - numberOfSteps;
         genome.step++;
       }
     }
     // Kill dot
     else
     {
        isDead = true; 
     }
   }
   
   
   
   void update()
   {
     if(!isDead && !reachedGoal)
     {
       move();
       
       // Kill Dot at window
       if (pos.x < 4 || pos.y < 4 || pos.x > width-4 || pos.y > height-4) 
       { 
        isDead = true;
       }
       //else if(pos.x < 250 && pos.y < 210 && pos.x > 0 && pos.y > 200)//rect(0, 200, 250, 10);
       //{
       //  isDead = true;
       //}
       //New Goal
       //else if(pos.x > 760 && pos.x < 775 && pos.y > 400 && pos.y < 415)
       //{
       //  reachedGoal = true;
       //  isDead = true;
       //}
       ////OLD GOAL////
       else if(pos.x > 760 && pos.x < 775 && pos.y > 760 && pos.y < 775)
       {
         reachedGoal = true;
         isDead = true;
       }
     }
   }
   
   
   
   void calculateFitness()
   {
      float distance = abs(pos.x - goal.x) + abs(pos.y - goal.y);
      if(reachedGoal)
      {
        fitness = (float) 100000/(genome.step*genome.step); 
      }
      else
      {
         // Manhattan distance
        fitness = (float) (1.0/((distance*distance)+15));
      }
   }
}
