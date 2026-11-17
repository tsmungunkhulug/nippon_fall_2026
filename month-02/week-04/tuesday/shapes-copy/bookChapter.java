
/**
 * Write a description of class bookChapetr here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class bookChapter
{
    private String chapterTitle;
    private int totalPages;
    private int pagesRead = 0;
    
    public void titleName(String name, int x){
        chapterTitle = name;
        totalPages = x;
    }
    
    public int readPages(int count){
        pagesRead = pagesRead + count;
        return pagesRead;
    }
    
    public int getPagesLeft() {
        return totalPages - pagesRead;
    }
    
    public double estimatedMinutesToFinish(double mpp){
        return getPagesLeft() * mpp;
    }
}
