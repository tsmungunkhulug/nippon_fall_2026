

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class CoffeeMachineTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class CoffeeMachineTest
{
     @Test
     public void testMakeEspressoSuccess() {
     CoffeeMachine cm = new CoffeeMachine(100, 30);
     assertTrue(cm.makeEspresso());
     assertEquals(50, cm.getWaterMl());
     assertEquals(15, cm.getBeansGrams());
     assertEquals(1, cm.getCupsMade());
     }
     @Test
     public void testMakeEspressoFailsWhenLowOnBeans() {
     // TODO: 200мл ус, 10гр кофетой үед makeEspresso() false буцааж, ус
     CoffeeMachine cm = new CoffeeMachine(200, 10);
     assertEquals(false, cm.makeEspresso());
     assertEquals(200, cm.getWaterMl());
     }
     @Test
     public void testRefillAllowsMakingMoreCups() {
     // TODO: Нөөц дууссаны дараа refill хийж дахин кофе чанаж болж
     CoffeeMachine cm = new CoffeeMachine(50, 15);
     cm.makeEspresso();
     cm.makeEspresso();
     cm.refill(100, 30);
     cm.makeEspresso();
     assertEquals(2, cm.getCupsMade());
     }
}
