
/**
 * Write a description of class StaircaseBuilder here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class StaircaseBuilder
{
    public void buildStairs(int steps){
        for(int i = 0; i < steps; i++){
            Square s = new Square();
            s.changeSize(25);
            s.changeColor("blue");
            int x = 50 + i * 25;
            int y = 220 - i * 25;
            s.moveHorizontal(x - 60);
            s.moveVertical(y - 50);
            s.makeVisible();
        }
    }
}
