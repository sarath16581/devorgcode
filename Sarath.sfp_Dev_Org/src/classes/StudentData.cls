public class StudentData {
	public String sName;
    public Integer age;
    public Integer rollNumber;
    public Integer mathsMarks;
    public Integer langMarks;
    public Integer scienceMarks;
    public Integer socialMarks;
    public StudentData(String sName, Integer age, Integer rollNumber){
        this.sName = sName;
        this.age = age;
        this.rollNumber = rollNumber;
        
    }
    public StudentData(Integer mMarks, Integer lMarks, Integer scMarks, Integer soMarks) {
       	mathsMarks = mMarks;
        langMarks = lMarks;
        scienceMarks = scMarks;
        socialMarks = soMarks;
    }
    public String CalculateRollNumber(){
        if(rollNumber < 100000) {
        rollNumber = rollNumber + 1;
        System.debug ('Your Assigned Roll Number is : ' +rollNumber);
        return 'Roll Number Assigned';
    }
    else {
        System.debug ('Roll number exceeded the alloted Quota');
        return 'Roll Number not Assigned';
    }       
    }
    public String CalculateGrade(){
        Integer totalMarks;
        String grade;
        totalMarks = mathsMarks + langMarks + scienceMarks + socialMarks;
        if (totalMarks >= 400*0.8){
            grade = 'A';
            System.debug ('Your Grade is : ' +grade);
            return 'Grade A';
            
        }
        else if (totalMarks >= 400*0.6 && totalMarks < 400*0.8 ){
            grade = 'B';
            System.debug ('Your Grade is : ' +grade);
            return 'Grade B';
            
        }
        else if (totalMarks >= 400*0.4 && totalMarks < 400*0.6 ){
            grade = 'C';
            System.debug ('Your Grade is : ' +grade);
            return 'Grade C';
            
        }
        else 
            grade = 'D';
            System.debug ('Your Grade is : ' +grade);
        	return 'Grade D';
    }
}