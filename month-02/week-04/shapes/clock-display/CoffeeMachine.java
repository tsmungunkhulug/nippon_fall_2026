
/**
 * Write a description of class CoffeeMachine here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

public class CoffeeMachine {
    private int waterMl;
    private int beansGrams;
    private int cupsMade;

    public CoffeeMachine(int initialWater, int initialBeans) {
        waterMl = Math.max(0, initialWater);
        beansGrams = Math.max(0, initialBeans);
        cupsMade = 0;
    }

    public int getWaterMl() {
        return waterMl;
    }

    public int getBeansGrams() {
        return beansGrams;
    }

    public int getCupsMade() {
        return cupsMade;
    }

    public void refill(int water, int beans) {
        if (water > 0) {
            waterMl = waterMl + water;
        }
        
        if (beans > 0) {
            beansGrams = beansGrams + beans;
        }
    }

    public boolean makeEspresso() {
        if (waterMl >= 50 && beansGrams >= 15) {
            waterMl = waterMl - 50;
            beansGrams = beansGrams - 15;
            cupsMade++;

            return true;
        }

        return false;
    }
}

