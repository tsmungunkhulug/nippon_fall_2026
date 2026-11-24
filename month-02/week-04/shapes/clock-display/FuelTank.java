
/**
 * Write a description of class FuelTank here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

public class FuelTank {
    private double liters;
    private double maxLiters;
    private double kmPerLiter;

    public FuelTank(double capacity, double efficiency) {
        if (capacity > 0) {
            maxLiters = capacity;
        } else {
            maxLiters = 50.0;
        }

        if (efficiency > 0) {
            kmPerLiter = efficiency;
        } else {
            kmPerLiter = 10.0;
        }

        liters = 0.0;
    }

    public double getLiters() {
        return liters;
    }

    public void refuel(double addedLiters) {
        if (addedLiters > 0) {
            liters += addedLiters;

            if (liters > maxLiters) {
                liters = maxLiters;
            }
        }
    }

    public double drive(double distanceKm) {
        double requiredFuel = distanceKm / kmPerLiter;

        if (liters >= requiredFuel) {
            liters -= requiredFuel;
            return distanceKm;
        } else {
            double possibleDistance = liters * kmPerLiter;
            liters = 0.0;
            return possibleDistance;
        }
    }
}
