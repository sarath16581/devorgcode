public class ListExample1 {
    public List<String> s1;
    public ListExample1(){
        s1 =  new List<String>();
       
    }
    public void listAdd(){
        s1.add('sarath');
        s1.add('burra');
        s1.add('capital');
        system.debug(s1);
    }
}