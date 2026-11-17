
/**
 * Write a description of class bankAccount here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class bankAccount
{
    private String owner;
    private int pin = 0000;
    private double balance;
    private int failedAttempts = 0;
    private boolean isLocked = false;
    
    public void deposit(double amount){
        if (isLocked == true) {
            System.out.println("Account is locked!");
        }
        else if (amount <= 0) {
            System.out.println("Invalid amount");
        }
        else {
            balance = balance + amount;
            System.out.println("Deposited $" + amount + ". New balance: $" + balance);
        }
    }
    
    public void withdraw(int epin, double amount){
        if (isLocked == true) {
            System.out.println("Account is locked! Contact bank");
        }
        else if (epin != pin){
            failedAttempts = failedAttempts + 1;
            if (failedAttempts < 3) {
                System.out.println("Wrong PIN! attempts left" + (3 - failedAttempts));
            }
            else if (failedAttempts > 3){
                isLocked = true;
                System.out.println("3 wrong PINs! account is LOCKED");
            }
        } 
        else if (epin == pin ) {
            failedAttempts = 0;
            if (amount > balance) {
                System.out.println("Insufficent funds!");
            }
            else if(amount < balance){
                balance = balance - amount;
                System.out.println("Withdrew $" + amount + ". balance: $" + balance);
                if (balance < 50.0) {
                    balance = balance - 2.5;
                    System.out.println("minimium amount fee: 2.5$ (minimium amount: 50$)" + "balance: $"+ balance);
                }
            }
            
        } 
    }
    
    public void unlockAccount(int masterCode) {
            if(masterCode == 9999){
                isLocked = false;
                failedAttempts = 0;
                System.out.println("Account unlocked");
            }
        }
}
