

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class ThermostatTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class ThermostatTest
{
     @Test
     public void testDefaultTemperatureIs22() {
     Thermostat t = new Thermostat();
     assertEquals(22, t.getTemperature());
     }
     @Test
     public void testIncreaseTemp() {
     Thermostat t = new Thermostat();
     t.increaseTemp();
     assertEquals(23, t.getTemperature());
     }
     @Test
     public void testMaxTemperatureLimitIs30() {
     // TODO: 15 удаа increaseTemp() дуудахад 30-аас хэтрэхгүй байгаа
     Thermostat t = new Thermostat();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     t.increaseTemp();
     assertEquals(30, t.getTemperature());
     }
     @Test
     public void testMinTemperatureLimitIs16() {
     // TODO: 15 удаа decreaseTemp() дуудахад 16-аас доош орохгүй
     Thermostat t = new Thermostat();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     t.decreaseTemp();
     assertEquals(16, t.getTemperature());
     }
}
