
/**
 * Write a description of class TargetDrawer here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class TargetDrawer
{
    public void drawTarget(int rings){
        for(int i = 0; i < rings; i++){
            int size = 200 - (i * 30);
            if(size <= 0 ){
                break;
            }
            Square s = new Square();
            s.changeSize(size);
            
            if(i % 2 == 0 ) {
                s.changeColor("red");
            }
            else {
                s.changeColor("yellow");
            }
            
            int x = (150 - size) / 2;
            int y = (150 - size) / 2;
            s.moveHorizontal(x - 60);
            s.moveVertical(y - 50);
            s.makeVisible();
        }
    }
}
