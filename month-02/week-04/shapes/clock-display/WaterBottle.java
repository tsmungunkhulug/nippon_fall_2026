
/**
 * Write a description of class WaterBottle here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class WaterBottle
{
     private int waterMl = 0;
     private int capacityMl;
     public WaterBottle(int capacity) {
     // TODO 1: Хэрэв capacity > 0 бол capacityMl = capacity болгоно,
     
     if(capacity > 0){
         capacityMl = capacity;
     }
     else {
         capacityMl = 500;
     }
     // Анх сав хоосон байх тул waterMl = 0 байна.
     }
     // TODO 2: getWaterMl гэдэг нэртэй одоогийн усны хэмжээг буцаадаг
     public int getWaterMl(){
         return waterMl;
     }
     // () -> int
     // TODO 3: fill гэдэг нэртэй method бичнэ үү
     // int -> void (amount гэдэг параметр авна)
     // Хэрэв amount > 0 бол waterMl-ийг нэмнэ (гэхдээ capacityMl-ээс
     public void fill(int amount){
         if(amount > 0 ){
             waterMl = waterMl + amount;
             if(waterMl >= capacityMl){
                 waterMl = capacityMl;
             }
            }
     }
     // TODO 4: drink гэдэг нэртэй method бичнэ үү
     // int -> void (amount гэдэг параметр авна)
     // Хэрэв amount > 0 бол waterMl-ийг хасна (0-ээс бага болгохгүй).
     public void drink(int amount){
         if(amount > 0){
             waterMl = waterMl - amount;
             if(waterMl <= 0){
                 waterMl = 0;
             }
         }
     }
}
