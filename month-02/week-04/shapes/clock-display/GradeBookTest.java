

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class GradeBookTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class GradeBookTest
{
     @Test
     public void testEmptyGradeBookReturnsZero() {
     GradeBook gb = new GradeBook(4);
     assertEquals(0.0, gb.getAverage(), 0.001);
     assertEquals(0, gb.getHighest());
     }
     @Test
     public void testAverageAndHighestCalculation() {
     GradeBook gb = new GradeBook(4);
     gb.addScore(80);
     gb.addScore(90);
     gb.addScore(100);
     assertEquals(90.0, gb.getAverage(), 0.001);
     assertEquals(100, gb.getHighest());
     }
     @Test
     public void testRejectInvalidScoresAndOverflow() {
     // TODO: -5 болон 105 оноог авахгүй байх, мөн багтаамжаас хэтэрсэн
     GradeBook gb = new GradeBook(4);
     assertFalse(gb.addScore(-5));
     assertFalse(gb.addScore(105));
     }
}
