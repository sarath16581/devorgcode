public class ListExample2 {

    public List <String> cityNames;
    public List <String> addCity;
    public ListExample2(){
        cityNames = new List<String>{'Hyd', 'Chn', 'Ban'};
        addCity= new List<String>();   
              
    }
    public void city(){
        addCity.addAll(cityNames);
        system.debug (addCity);
        
    }
   
}