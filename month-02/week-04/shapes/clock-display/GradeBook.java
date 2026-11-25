
/**
 * Write a description of class GradeBook here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class GradeBook
{
    private int[] scores;
    private int count;
    
    public GradeBook(int maxExams){
        if(maxExams > 0){
            scores = new int[maxExams];
        }
        else{
            scores = new int[5];
            count = 0;
        }
    }
    
    public boolean addScore(int score){
        if(score >= 0 && score <= 100){
            scores[count] = score;
            count++;
            return true;
        }
        return false;
    }
    
    public double getAverage(){
        double total = 0.0;
        if(count == 0){
            return 0.0;
        }
        for(int i = 0; i < count; i++){
            total = total + scores[i];
        }
        return total/count;
    }
    
    public int getHighest(){
        int highest = scores[0];
        if(count == 0){
            return 0;
        }
        for(int i = 0; i < count; i++){
            if(scores[i] > highest){
                highest = scores[i];
            }
        }
        return highest;
    }
}
