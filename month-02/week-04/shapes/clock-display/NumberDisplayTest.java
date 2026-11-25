import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

/**
 * NumberDisplay-ийн тест.
 */
public class NumberDisplayTest {

    @Test
    public void startsAtZero() {
        assertEquals(0, new NumberDisplay(60).getValue());
    }

    @Test
    public void incrementWrapsAtLimit() {
        NumberDisplay display = new NumberDisplay(60);
        display.setValue(59);
        display.increment();
        assertEquals(0, display.getValue());
    }

    @Test
    public void displayValueHasTwoDigits() {
        NumberDisplay display = new NumberDisplay(60);
        display.setValue(5);
        assertEquals("05", display.getDisplayValue());
        display.setValue(42);
        assertEquals("42", display.getDisplayValue());
    }

    @Test
    public void outOfRangeValuesAreIgnored() {
        NumberDisplay display = new NumberDisplay(24);
        display.setValue(7);
        display.setValue(24);
        display.setValue(-1);
        assertEquals(7, display.getValue());
    }
    
    @Test
    public void tenHasNoExtraZero()
    {
        NumberDisplay display1 = new NumberDisplay(60);
        display1.setValue(10);
        assertEquals("10", display1.getDisplayValue());
    }
    
    public class AlarmTest
{
    @Test
    public void noAlarmByDefault()
    {
        ClockDisplay clock = new ClockDisplay(7, 30);
        assertEquals("--:--", clock.getAlarm());
        assertFalse(clock.isRinging());
    }

    @Test
    public void ringsAtAlarmTime()
    {
        ClockDisplay clock = new ClockDisplay(7, 29);
        clock.setAlarm(7, 30);
        assertFalse(clock.isRinging());
        clock.timeTick();
        assertTrue(clock.isRinging());
    }

    @Test
    public void alarmOffStopsRinging()
    {
        ClockDisplay clock = new ClockDisplay(6, 5);
        clock.setAlarm(6, 5);
        assertEquals("06:05", clock.getAlarm());
        clock.alarmOff();
        assertFalse(clock.isRinging());
    }

    @Test
    public void invalidAlarmIsIgnored()
    {
        ClockDisplay clock = new ClockDisplay();
        clock.setAlarm(24, 0);
        clock.setAlarm(7, 60);
        assertEquals("--:--", clock.getAlarm());
    }
}
}
