
/**
 * Write a description of class waterBottle here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class waterBottle
{
    private int capacityMl = 1000;
    private int currentMl = capacityMl;
    
    public int takeSip(int sipMl){
        currentMl = currentMl - sipMl;
        return currentMl;
    }
    
    public void refillFull(){
        currentMl = capacityMl;
    }
    
    public double getPercentFull (){
        return currentMl * 100.0 / capacityMl;
    }
}
