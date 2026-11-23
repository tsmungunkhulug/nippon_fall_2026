
/**
 * Write a description of class StepCounter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class StepCounter
{
    private int steps;

    public StepCounter() {
        steps = 0;
    }
    // getSteps гэдэг нэртэй steps-ийг буцаадаг method бичнэ үү
    // () -> int
    public int getSteps(){
        return steps;
    }
    // addSteps гэдэг нэртэй
    // int -> void (count гэдэг параметр авдаг байна)
    // хэрвээ count > 0 бол steps-ийг count-аар нэмнэ
    // үгүй бол "Алдаа: Алхмын тоо эерэг байх ёстой!" гэж хэвлэнэ
    public int addSteps(int count){
        if(count > 0 ) {
            steps = steps + count;
        }
        else {
            System.out.println("Алдаа: Алхмын тоо эерэг байх ёстой!");
        }
        return steps;
    }
    // reset гэдэг нэртэй
    // () -> void
    // steps-ийг 0 болгоно
    public void reset(){
        steps = 0;
    }
}
