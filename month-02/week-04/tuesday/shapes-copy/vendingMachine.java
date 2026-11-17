
/**
 * Write a description of class vendingMachine here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class vendingMachine
{
     private String itemName = "coca-cola";
     private double itemPrice = 2.75;
     private int stock = 10;
     private double insertMoney = 0.0;
     private double totalRevenue = 0.0;
     
     public void insertMoney(double amount){
         if(amount == 0.25 || amount == 0.50 || amount == 1.00 || amount == 5.00){
             insertMoney = insertMoney + amount;
             System.out.println("Credit: $" + insertMoney);
         }
         else {
            System.out.println("Invalid coin/bill rejected");
         }
     }
     
  
     
     public double buyItem() {
        double change;
        if (stock <= 0) {
            System.out.println("SOLD OUT");
            return 0;
        }
        else if (insertMoney < itemPrice) {
            System.out.println("Need $" + (itemPrice - insertMoney) + " more.");
            return 0;
        }
        else {
            change = insertMoney - itemPrice;
            stock = stock - 1;
            totalRevenue = totalRevenue + itemPrice;
            insertMoney = 0;
            System.out.println("Dispensing " + itemName + "! Your change: $" + change);
            return change;
        }
     }


     public double cancelAndRefund() {
        double s;
        s = insertMoney;
        insertMoney = 0;
        return s;
     }
}
