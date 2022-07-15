public class Genome
{
  public int directions[];
   
  int step = 0;

  Genome(int size)
  {
    
    directions = new int[size];
    
    for(int i = 0; i < directions.length; i++)
    {
      int direction = floor(random(1,9));
      directions[i] = direction;
    }
  }
}
