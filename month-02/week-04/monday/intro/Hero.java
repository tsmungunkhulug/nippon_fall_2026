
/**
 * Write a description of class hero here.
 *
 * @author (your name)
 * @version (a version number or a date)
 * 
 */

public class Hero
{
    private String name;
    private int health;
    private int gold;
    
    public Hero(String HeroName){
        name = HeroName;
        health = 100;
        gold = 0;
    }
    
    public Hero(){
        name = "CORTES";
        health = 100;
        gold = 0;
    }
    public void findGold(int amount) {
    gold = gold + amount;
    System.out.println(name + "found" + amount + "gold! Total:" + gold);
    }
    
    public void takeDamage(int damage){
        health = health - damage;
        System.out.println(name + "took " + damage + "damage! health:" + damage);
    }
    
    public void drinkPotion(){
        health = health + 25;
        System.out.println(name + "drank a potion health" + health);
    }
}
