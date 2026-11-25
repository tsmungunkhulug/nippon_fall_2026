
/**
 * Write a description of class ShoppingCart here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class ShoppingCart
{
    private Product[] items;
    private int count;
    
    public ShoppingCart(){
        items = new Product[5];
        count = 0;
    }
    
    public int getItemCount(){
        return count;
    }
    
    public boolean addProduct(Product p){
        if(p != null && count < 5){
            items[count] = p;
            count++;
            return true;
        }
        return false;
    }
    public double getTotalPrice(){
        double total = 0.0;
        for(int i = 0; i < count; i++){
            total = total + items[i].getPrice();
        }
        return total;
    }
}
