

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class ScoreBoardTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class ScoreBoardTest
{
     @Test
     public void testInitialScoreAndLevel() {
     ScoreBoard sb = new ScoreBoard();
     assertEquals(0, sb.getScore());
     assertEquals(1, sb.getLevel());
     }
     @Test
     public void testLevelUpAt100Points() {
     // TODO: 120 оноо нэмэхэд getScore() == 120, getLevel() == 2
     ScoreBoard sb = new ScoreBoard();
     sb.addPoints(120);
     assertEquals(2, sb.getLevel());
     }
     @Test
     public void testNegativePointsIgnored() {
     // TODO: Сөрөг оноо нэмэхэд score болон level өөрчлөгдөхгүй байхыг
     ScoreBoard sb = new ScoreBoard();
     sb.addPoints(-5);
     assertEquals(0, sb.getScore());
     }
}
