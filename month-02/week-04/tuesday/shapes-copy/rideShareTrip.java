
/**
 * Write a description of class rideShareTrip here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class rideShareTrip
{
    private String driverName = "Cortes";
    private String tripStatus = "WAITING";
    private double distanceKm = 0.0;
    private boolean isSurgePricing = true;
    private int discountPercent = 0;
    
    public void applyPromoCode(String code){
        if(code.equals("SAVE20")){
            discountPercent = 20;
            System.out.println("20% promo applied!");
        }
        else if(code.equals("HALF")){
            discountPercent = 50;
            System.out.println("50% promo applied!");
        }
        else {
            System.out.println("Invalid promo code");
        }
    }
    
    public void startTrip(){
        if(tripStatus.equals("WAITING")){
            tripStatus = "IN_PROGRESS";
            System.out.println("Trip started with " + driverName);
        }
        else {
            System.out.println("Cannot start trip. Current status: " + tripStatus);
        }
    }
    
    public double driveDistance(double Km){
        double fare;
        if(!tripStatus.equals("IN_PROGRESS")){
            System.out.println("No active trip to finish");
            return 0.0;
        }
        fare = 3.0 + (Km * 1.5);
        fare = fare - (fare * (discountPercent / 100.0));
        if(isSurgePricing == true){
            fare = fare * 1.5;
        }
        tripStatus = "COMPLETED";
        System.out.println("Trip completed! Final fare: $" + fare);
        return fare;
    }
}
