

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class FuelTankTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class FuelTankTest
{
     @Test
     public void testDriveWithEnoughFuel() {
     FuelTank tank = new FuelTank(40.0, 10.0); // 1 литрээр 10 км явна
     tank.refuel(20.0);
     double driven = tank.drive(150.0);
     assertEquals(150.0, driven, 0.001);
     assertEquals(5.0, tank.getLiters(), 0.001);
     }
     @Test
     public void testDriveRunsOutOfFuelHalfway() {
     FuelTank tank = new FuelTank(40.0, 10.0); 
     tank.refuel(5.0);
     tank.drive(50.0);
     assertEquals(0, tank.getLiters());
     // TODO: 5 литр шатахуунаар (10км/л) 100км явах гэхэд зөвхөн 50км
     }
     @Test
     public void testRefuelDoesNotOverflow() {
     // TODO: 40л багтаамжтай саванд 60л хийхэд 40л болохыг шалгана уу
     FuelTank tank = new FuelTank(40.0, 10.0); 
     tank.refuel(60);
     assertEquals(40, tank.getLiters());
     }
}
