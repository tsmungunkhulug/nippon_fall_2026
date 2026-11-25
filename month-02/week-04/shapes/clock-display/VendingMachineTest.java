

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class VendingMachineTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class VendingMachineTest
{
     @Test
     public void testBuyItemAndGetChange() {
     VendingMachine vm = new VendingMachine(5, 1.50);
     vm.insertCoin(2.00);
     double change = vm.buyItem();
     assertEquals(0.50, change, 0.001);
     assertEquals(4, vm.getStock());
     assertEquals(0.0, vm.getInsertedMoney(), 0.001);
     }
     @Test
     public void testInsufficientFundsReturnsMinusOne() {
     // TODO: 1.50 үнэтэй ундаанд 1.00 хийгээд buyItem() дуудахад -1.0
     VendingMachine vm = new VendingMachine(5, 1.50);
     vm.insertCoin(1.00);
     vm.buyItem();
     assertEquals(5, vm.getStock());
     }
     @Test
     public void testOutOfStockReturnsMinusOne() {
     // TODO: stock == 0 үед мөнгө хийсэн ч buyItem() -1.0 буцаахыг
     VendingMachine vm = new VendingMachine(0, 1.50);
     vm.insertCoin(5);
     assertEquals(-1.0, vm.buyItem());
     }
}
