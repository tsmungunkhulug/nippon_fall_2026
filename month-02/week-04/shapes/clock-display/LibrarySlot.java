
/**
 * Write a description of class LibrarySlot here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
/**
 * Нэг номыг уншигчид олгох, буцаан авах үйлдлийг удирдах класс.
 */
public class LibrarySlot {
    private Book book;
    private String borrowerName;

    public LibrarySlot(Book targetBook) {
        book = targetBook;
        borrowerName = "";
    }

    public String getBorrowerName() {
        return borrowerName;
    }

    public boolean lendTo(String readerName) {
        if (book != null && !book.isBorrowed() && readerName != null ){
            book.setBorrowed(true);
            borrowerName = readerName;
            return true;
        }
        return false;
    }

    public void returnBook() {
        if (book != null) {
            book.setBorrowed(false);
            borrowerName = "";
        }
    }
}
