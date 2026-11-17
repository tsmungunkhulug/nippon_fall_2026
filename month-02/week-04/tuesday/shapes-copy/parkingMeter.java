
/**
 * Write a description of class parkingMeter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class parkingMeter
{
  private int minutesRemaining = 0;
  private int totalCoinsInserted = 0;
  
  public void insertQuarter () {
       totalCoinsInserted =  totalCoinsInserted + 1;
       minutesRemaining = minutesRemaining + 15; 
  }
  
  public void insertDollar () {
       totalCoinsInserted =  totalCoinsInserted + 4;
       minutesRemaining = minutesRemaining + 60; 
  }
  
  public void waitTime (int minutesPassed) {
       minutesRemaining = minutesRemaining - minutesPassed; 
  }
  
  public double getHoursRemaining() {
    return minutesRemaining / 60.0;
 }
}
