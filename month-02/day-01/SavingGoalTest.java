

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class SavingGoalTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class SavingGoalTest
{
    @Test
    public void GoalReached(){
        SavingGoal acc = new SavingGoal();
        acc.savingGoals(1000);
        acc.save(600);
        assertEquals(false, acc.isGoalReached());
        acc.save(400);
        assertEquals(true, acc.isGoalReached());
    }
    
    @Test 
    public void negativeAmountNo(){
        SavingGoal acc = new SavingGoal();
        acc.save(500);
        acc.save(-300);
        assertEquals(500, acc.getSavedAmount());
    }
}
