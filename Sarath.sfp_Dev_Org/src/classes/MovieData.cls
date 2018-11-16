public class MovieData {
    public String mName;
    public Decimal cost;
    public static final Integer totalTkts = 300;
    public static Integer tktsAvail = 300;
    public static Decimal totalAmt = 0;
    public Decimal tax = 0.33;
    public static Boolean flag = false;
    public static Boolean checkAvail = false;
    public MovieData(String mName,Decimal cost){
        this.mName = mName;
        this.cost  = cost;
    }
    public Boolean Availability (Integer reqTkts){
        checkAvail = true;
        if (reqTkts > tktsAvail){
            System.debug('Your Requested number of Tickets :' + reqTkts+  'are not available');
            return flag;
        }
       
        else {
            flag = true;
            checkAvail = true;
            System.debug ('Your Requested number of Tickets :' + reqTkts +  'are available');
            return flag;
        }
    }
                         public String tktBooking(Integer reqTkts){
                             If (checkAvail == true){
                                    If (flag == false ){
                                    	System.debug('Your Requested number of Tickets :' + reqTkts +  'are not available');
                                        checkAvail = false;
                                    	return 'Tickets not available';
                                 
                             }
                                              else {
                                                  tktsAvail = tktsAvail-reqTkts;
                                                  totalAmt = (totalAmt + (reqTkts *cost));
                                                  totalAmt = totalAmt+ totalAmt * tax;
                                                  System.debug ('Your Requested number of Tickets :' + reqTkts +  'are booked. Please Pay: '+totalAmt );
                                                  flag = true;
                                                  checkAvail = false;
                                                  return 'Tickets Booked';
                                              }
                             }
                                 else {
                                     System.debug ('CheckAvailability before booking tickets');
                                     return 'Availability not checked';
                                 }
                             
                         }
}