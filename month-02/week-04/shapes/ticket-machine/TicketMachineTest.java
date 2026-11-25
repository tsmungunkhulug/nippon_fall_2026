import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * TicketMachine-ийн тест. Бүгд ногоон болтол TicketMachine-ийг засна.
 */
public class TicketMachineTest {
    private TicketMachine machine;

    @BeforeEach
    public void setUp() {
        machine = new TicketMachine(1000);
    }

    @Test
    public void insertMoneyAddsToBalance() {
        machine.insertMoney(500);
        machine.insertMoney(200);
        assertEquals(700, machine.getBalance());
    }

    @Test
    public void zeroAndNegativeMoneyAreRejected() {
        machine.insertMoney(0);
        machine.insertMoney(-100);
        assertEquals(0, machine.getBalance());
    }

    @Test
    public void ticketIsPrintedWhenBalanceIsEnough() {
        machine.insertMoney(1500);
        machine.printTicket();
        assertEquals(500, machine.getBalance());
        assertEquals(1000, machine.getTotal());
    }

    @Test
    public void exactBalanceIsEnough() {
        machine.insertMoney(1000);
        machine.printTicket();
        assertEquals(0, machine.getBalance());
        assertEquals(1000, machine.getTotal());
    }

    @Test
    public void noTicketWhenBalanceIsShort() {
        machine.insertMoney(500);
        machine.printTicket();
        assertEquals(500, machine.getBalance());
        assertEquals(0, machine.getTotal());
    }

    @Test
    public void refundReturnsBalanceAndEmptiesIt() {
        machine.insertMoney(700);
        assertEquals(700, machine.refundBalance());
        assertEquals(0, machine.getBalance());
    }
    
    @Test
    public void zeroPriceIsIgnored()
    {
        TicketMachine machine1 = new TicketMachine(1000);
        machine1.setPrice(0);
        assertEquals(1000, machine1.getPrice());
    }

    public class DiscountTest
{
    private TicketMachine machine;

    @BeforeEach
    public void setUp()
    {
        machine = new TicketMachine(1000);
    }

    @Test
    public void noDiscountByDefault()
    {
        assertEquals(1000, machine.getTicketPrice());
    }

    @Test
    public void studentDiscount()
    {
        machine.setDiscount(20);
        assertEquals(800, machine.getTicketPrice());
    }

    @Test
    public void discountOutsideRangeIsIgnored()
    {
        machine.setDiscount(20);
        machine.setDiscount(60);
        machine.setDiscount(-10);
        assertEquals(800, machine.getTicketPrice());
    }

    @Test
    public void discountedTicketCostsLess()
    {
        machine.setDiscount(50);
        machine.insertMoney(500);
        machine.printTicket();
        assertEquals(0, machine.getBalance());
        assertEquals(500, machine.getTotal());
    }
}
}
