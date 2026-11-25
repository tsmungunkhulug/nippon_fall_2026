
/**
 * Write a description of class VendingMachine here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class VendingMachine
{
    private int stock;
    private double itemPrice;
    private double insertedMoney;
    
    public VendingMachine(int initialStock, double price){
        if(initialStock >= 0){
            stock = initialStock;
        }
        else {
            initialStock = 0;
        }
        if(price > 0){
            itemPrice = price;
        }
        else{
            itemPrice = 1.0;
        }
        insertedMoney = 0.0;
    }
    
    public int getStock(){
        return stock;
    }
    
    public double getInsertedMoney(){
        return insertedMoney;
    }
    
    public void insertCoin(double amount){
        if(amount > 0){
            insertedMoney = insertedMoney + amount;
        }
    }
    
    public double buyItem(){
        double change;
        if(stock > 0 && insertedMoney >= itemPrice){
            stock = stock - 1;
            change = insertedMoney - itemPrice;
            insertedMoney = 0;
            return change;
        }
        else{
            return -1.0;
        }
    }
}
