
/**
 * Write a description of class house here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class house
{
   private Square body;
   private Square window;
   private Triangle roofTop;
   private Circle sun;
   private Circle blue;
   
   public  house(){
       body = new Square();
       window = new Square();
       roofTop = new Triangle();
       sun = new Circle();
       blue = new Circle();
   }
   
   public void draw(){
       body.changeColor("red");
       body.changeSize(150);
       body.moveHorizontal(-170);
       body.moveVertical(40);
       body.makeVisible();
       
       window.changeColor("balck");
       window.changeSize(45);
       window.moveHorizontal(-140);
       window.moveVertical(75);
       window.makeVisible();
       
       roofTop.changeColor("green");
       roofTop.changeSize(80, 200);
       roofTop.moveHorizontal(5);
       roofTop.moveVertical(-50);
       roofTop.makeVisible();
       
       sun.changeColor("yellow");
       sun.changeSize(90);
       sun.moveHorizontal(335);
       sun.moveVertical(-15);
       sun.makeVisible();
       
       blue.changeColor("blue");
       blue.changeSize(80);
       blue.moveHorizontal(220);
       blue.moveVertical(-30);
       blue.makeVisible();
   }
}
