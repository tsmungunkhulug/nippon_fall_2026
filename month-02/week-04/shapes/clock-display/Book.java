
/**
 * Write a description of class Book here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Book
{
    private String title;
    private boolean borrowed;
    
    public Book(String bookTitle){
        title = bookTitle;
        borrowed = false;
    }
    
    public String getTitle(){
        return title;
    }
    
    public boolean isBorrowed(){
        return borrowed;
    }
    
    public void setBorrowed(boolean borrowed){
        borrowed = true;
    }
}
