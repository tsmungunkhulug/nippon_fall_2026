

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class ParkingMeterTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class ParkingMeterTest
{
    @Test
    public void parkingMeterTest(){
        ParkingMeter acc = new ParkingMeter();
        acc.addTime(30);
        acc.addTime(-10);
        assertEquals(30, acc.getMinutes());
    }
    
    @Test
    public void notBelowZero(){
        ParkingMeter acc = new ParkingMeter();
        acc.addTime(1);
        acc.tick();
        acc.tick();
        assertEquals(0, acc.getMinutes());
    }
}
