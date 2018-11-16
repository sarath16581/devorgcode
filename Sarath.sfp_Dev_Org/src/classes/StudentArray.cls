public class StudentArray {
    public StudentWrapper[] students {set;get;}
    public StudentArray(String name,Integer age,String classStandard){
        StudentWrapper sw1 = new StudentWrapper();
        	sw1.name = name;
        	sw1.age = age;
        	sw1.classStandard = classStandard;
        StudentWrapper sw2 = new StudentWrapper();
        	sw2.name = name;
        	sw2.age = age;
        	sw2.classStandard = classStandard;
        StudentWrapper sw3 = new StudentWrapper();
        	sw3.name = name;
        	sw3.age = age;
        	sw3.classStandard = classStandard;
        students = new StudentWrapper[]{sw1,sw2,sw3};
    }
    public void submit(){
        
    }

}