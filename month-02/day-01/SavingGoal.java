
/**
 * Write a description of class SavingGoal here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class SavingGoal
{
   private int targetAmount;
   private int savedAmount;
   
   public void savingGoals(int target){
       targetAmount = target;
       savedAmount = 0;
   }
   
   public int getSavedAmount(){
       return savedAmount;
   }
   
   public void save(int amount){
       if(amount > 0){
           savedAmount = savedAmount + amount;
       }
       else {
           System.out.println("Алдаа: Эерэг дүн оруулна уу!");
       }
   }
   
   public boolean isGoalReached(){
       if(savedAmount >= targetAmount){
           return true;
       }
       else{
           return false;
       }
   }
}
