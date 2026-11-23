
/**
 * Write a description of class LightBulb here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class LightBulb
{
   private boolean isOn = false;
   private int brightness = 0;
   
   public int getBrightness(){
       return brightness;
   }
   
   public void turnOn(){
       isOn = true;
       if(brightness == 0){
           brightness = 50;
       }
   }
   
   public void turnOff(){
       isOn = false;
       brightness = 0;
   }
   
   public boolean isOn(){
       if(isOn == true){
           return true;
       }
       else {
           return false;
       }
   }
}
