
/**
 * Write a description of class BankAccount here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class BankAccount
{
    private double balance;

    public BankAccount(){
        balance = 0.0;
    }

    public double getBalance(){
        return balance;
    }

    public void deposit(double amount){
        if(amount > 0){
            balance = balance + amount;
            System.out.println(balance);
        }
        else {
            System.out.println("Aldaa: 0-ees ih dun oruulna uu");
        }
    }
}
