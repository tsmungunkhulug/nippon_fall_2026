
/**
 * Write a description of class Elevator here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Elevator
{
     private int currentFloor;
     private int maxFloor;
     private boolean doorOpen;
     public Elevator(int topFloor) {
     // TODO 1: currentFloor = 1, doorOpen = false байна.
     // Хэрэв topFloor >= 2 бол maxFloor = topFloor, үгүй бол maxFloor =
     currentFloor = 1;
     doorOpen = false;
     if(topFloor >= 2){
         maxFloor = topFloor;
     }
     else{
         maxFloor = 5;
     }
     }
     // TODO 2: getCurrentFloor (() -> int), isDoorOpen (() -> boolean)
     public int getCurrentFloor(){
         return currentFloor;
     }
     public boolean isDoorOpen(){
         return doorOpen;
     }
     // TODO 3: openDoor (() -> void) ба closeDoor (() -> void) бичнэ үү
     public void openDoor(){
         doorOpen = true;
     }
     public void closeDoor(){
         doorOpen = false;
     }
     // TODO 4: goToFloor гэдэг нэртэй method бичнэ үү
     // int -> boolean (targetFloor гэдэг параметр авна)
     // Хаалга хаалттай (doorOpen == false) БА targetFloor нь 1..maxFloor
     public boolean goToFloor(int targetFloor){
         if(doorOpen == false && 1 < targetFloor && targetFloor <= maxFloor){
             currentFloor = targetFloor;
             return true;
         }
         else {
             return false;
         }
     }
     // currentFloor-ийг өөрчлөөд true буцаана. Бусад үед хөдлөхгүй ба fals
}
