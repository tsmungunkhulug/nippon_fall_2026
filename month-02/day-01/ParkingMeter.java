
/**
 * Write a description of class ParkingMeter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class ParkingMeter
{
    private int minutes = 0;
    
    public int getMinutes(){
        return minutes;
    }
    
    public int addTime(int mins){
        if(mins > 0){
            minutes = minutes + mins;
        }
        if(mins <= 0){
            System.out.println("Алдаа: 0-ээс их минут оруулна уу!");
        }
        return minutes;
    }
    
    public void tick(){
        if(minutes > 0) {
            minutes = minutes - 1;
        }
    }
}
