
/**
 * Write a description of class RPGCharacter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class RPGCharacter
{
    private String name = "CORTES";
    private int level = 1;
    private int hp = 100;
    private int mana = 50;
    private int attackCount = 0;
    private boolean isAlive = true;
    
    public void receiveDamage(int dmg){
        if(!isAlive) {
            System.out.println(name + " is already defeated");
            return;
        }
        hp = hp - dmg;
        if(hp <= 0) {
            hp = 0;
            isAlive = false;
            System.out.println(name + " has fallen in battle");
        }
        else {
            System.out.println(name + " took " + dmg + " dmg! hp left: " + hp);
        }
    }
    
    public void attack(RPGCharacter enemy){
        int dmg;
        dmg = 15 + level * 3;
        if(!isAlive){
            System.out.println(name + " cannot attack while defeated!");
            return;
        }
        attackCount = attackCount + 1; 
        if (attackCount % 3 == 0) {
            dmg = dmg * 2;
            System.out.println("CRITICAL HIT!");
        }
        enemy.receiveDamage(dmg);
    }
    public void castHeal(){
        if (isAlive == true && mana >= 20){
            mana = mana - 20;
            hp = hp + 35;
            if (hp > 100) {
                hp = 100;
            }
            System.out.println(name + " healed! HP: " + hp + "Mana: " + mana);
        }
        else {
            System.out.println("Cannot heal (Dead or not enough mana)");
        }
    }
}
