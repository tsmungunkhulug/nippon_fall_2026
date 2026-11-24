

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class LibrarySlotTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class LibrarySlotTest
{
     @Test
     public void testLendBookSuccess() {
     Book b = new Book("Clean Code");
     LibrarySlot slot = new LibrarySlot(b);
     assertTrue(slot.lendTo("Bataa"));
     assertTrue(b.isBorrowed());
     assertEquals("Bataa", slot.getBorrowerName());
     }
     @Test
     public void testCannotLendAlreadyBorrowedBook() {
     // TODO: Bataa авсан байхад Sarnai авах гэхэд false буцааж,
     Book b = new Book("Clean Code");
     LibrarySlot slot = new LibrarySlot(b);
     slot.lendTo("Bataa");
     slot.lendTo("Sarnai");
     assertEquals(false, b.isBorrowed());
     assertEquals("bataa", slot.getBorrowerName());
     }
     @Test
     public void testReturnBookAllowsNextBorrower() {
     // TODO: returnBook() дуудсаны дараа Sarnai номыг авч чадаж байгааг
     Book b = new Book("Clean Code");
     LibrarySlot slot = new LibrarySlot(b);
     slot.returnBook();
     slot.lendTo("Sarnai");
     assertEquals("Sarnai", slot.getBorrowerName());
     }
}
