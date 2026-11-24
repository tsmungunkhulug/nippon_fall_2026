
/**
 * Write a description of class LibrarySlot here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class LibrarySlot
{
    private Book book;
    private String borrowerName;
    
    public LibrarySlot(Book targetBook){
        book = targetBook;
        borrowerName = "";
    }
    
    public String getBorrowerName(){
        return borrowerName;
    }
    
    public boolean lendTo(String readerName){
        if(book != null && !book.isBorrowed() && !readerName.isEmpty()){
            book.setBorrowed(true);
            borrowerName = readerName;
            return true;
        }
        else{
            return false;
        }
    }
    
    public void returnBook(){
        book.setBorrowed(false);
        borrowerName = "";
    }
}
