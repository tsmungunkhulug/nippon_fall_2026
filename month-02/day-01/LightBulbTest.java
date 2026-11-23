

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class LightBulbTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class LightBulbTest
{
    @Test
    public void lightBulbOn(){
        LightBulb acc = new LightBulb();
        acc.turnOn();
        assertEquals(true, acc.isOn());
        assertEquals(50, acc.getBrightness());
    }
    
    @Test
    public void lightBulbOff(){
        LightBulb acc = new LightBulb();
        acc.turnOff();
        assertEquals(false, acc.isOn());
        assertEquals(0, acc.getBrightness());
    }
}
