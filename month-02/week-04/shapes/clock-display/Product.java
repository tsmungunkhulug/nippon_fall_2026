
/**
 * Write a description of class Product here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Product
{
    private String name;
    private double price;
    
    public Product(String productName, double productPrice){
        name = productName;
        if(productPrice <= 0){
            price = 0.0;
        }
        else {
            price = productPrice;
        }
    }
    
    public String getName(){
        return name;
    }
    
    public double getPrice(){
        return price;
    }
}
