public class TotMarks {

    public Integer iMarks;
    public Integer eMarks;
    public Integer total;
    public TotMarks(Integer iMarks, Integer eMarks){
       TotMarks tm1 = new TotMarks (60,60);
        this.iMarks = iMarks;
        this.eMarks = eMarks;
     }
    public void sum (){
        total = iMarks + eMarks;
        System.debug (total);
        
    }
    
}