

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class ShoppingCartTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class ShoppingCartTest
{
     @Test
     public void testAddProductsAndTotal() {
     ShoppingCart cart = new ShoppingCart();
     assertTrue(cart.addProduct(new Product("Apple", 2.5)));
     assertTrue(cart.addProduct(new Product("Milk", 3.5)));
     assertEquals(2, cart.getItemCount());
     assertEquals(6.0, cart.getTotalPrice(), 0.001);
     }
     @Test
     public void testCartCapacityLimitIs5() {
     // TODO: 5 бараа нэмсний дараа 6 дахь бараа нэмэхэд false буцааж,
     ShoppingCart cart = new ShoppingCart();
     assertTrue(cart.addProduct(new Product("Apple", 2.5)));
     assertTrue(cart.addProduct(new Product("Milk", 3.5)));
     assertTrue(cart.addProduct(new Product("Pen", 4.5)));
     assertTrue(cart.addProduct(new Product("Banana", 5.5)));
     assertTrue(cart.addProduct(new Product("Eraser", 1.5)));
     assertEquals(false, cart.addProduct(new Product("Strawberry", 6.5)));
     assertEquals(5, cart.getItemCount());
     }
     @Test
     public void testNullProductRejected() {
     // TODO: null дамжуулахад false буцааж count нэмэгдэхгүй байгааг
     ShoppingCart cart = new ShoppingCart();
     cart.addProduct(null);
     assertEquals(0, cart.getItemCount());
     }
}
