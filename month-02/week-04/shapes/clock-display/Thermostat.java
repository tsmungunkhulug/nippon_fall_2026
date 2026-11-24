
/**
 * Write a description of class Thermostat here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Thermostat
{
     private int temperature;
     public Thermostat() {
         temperature = 22;
     // TODO 1: Анхны температур 22 градус байна.
     }
     // TODO 2: getTemperature гэдэг нэртэй method бичнэ үү
     public int getTemperature(){
         return temperature;
     }
     // () -> in
     // TODO 3: increaseTemp гэдэг нэртэй method бичнэ үү
     public void increaseTemp(){
         temperature = temperature  + 1;
         if (temperature >= 30){
             temperature = 30;
         }
     }
     // () -> void
     // temperature-ийг 1-ээр нэмнэ (хамгийн ихдээ 30 байна).
     // TODO 4: decreaseTemp гэдэг нэртэй method бичнэ үү
     public void decreaseTemp(){
         temperature = temperature  - 1;
         if (temperature <= 16){
             temperature = 16;
         }
     }
     // () -> void
     // temperature-ийг 1-ээр хасна (хамгийн багадаа 16 байна).
}
