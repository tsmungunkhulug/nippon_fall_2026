
/**
 * Write a description of class Elevator here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Elevator
{
    private int currentfloor = 1;
    private int totalTrips = 0;
    
    
    
    public void goUp(int x){
        currentfloor = currentfloor + x;
        totalTrips = totalTrips + 1;
    }
    
    public void goDown(int x){
        currentfloor = currentfloor - x;
        totalTrips = totalTrips + 1;
    }
    
    public int getCurrentfloor(){
        return currentfloor;
    }
    
    public String getStatus(){
        return "Elevator is on floor " + currentfloor + " (total trips: " + totalTrips + ")";
    }
    
}
