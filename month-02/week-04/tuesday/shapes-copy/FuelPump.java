
/**
 * Write a description of class FuelPump here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class FuelPump
{
  private double pricePerLiter = 3500;
  private double literDispensed;
  
  public double pumpFuel(double liters){
      literDispensed = literDispensed + liters;
      return literDispensed;
  }
  
  public double getTotalCost(){
      return  literDispensed * pricePerLiter;
  }
  
  public double resetPump(){
      literDispensed = 0;
      return literDispensed;
  }
}
