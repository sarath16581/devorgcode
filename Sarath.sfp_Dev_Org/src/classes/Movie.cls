public class Movie {
	public String mName;
    public Integer availnoofTkts;
    public Decimal costofTkt;
    public Movie (String mName,Integer availnoofTkts,Decimal costofTkt){
        this.mName = mName;
        this.availnoofTkts = availnoofTkts;
        this.costofTkt = costofTkt;
         }
    public String tktBooking (Integer tktsReqrd){
        Decimal totalCost;
        if (tktsReqrd > availnoofTkts){
            System.debug ('Required Tickets Not available');
            return 'tickets cannot be booked';
        }
        else {
          	totalCost = tktsReqrd * costofTkt;
        	System.debug ('Total Amount to be paid : ' +totalCost);
        	return 'tickets can be booked'  ;
        }
            
    }
}