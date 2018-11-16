public class DIFC_LAV_Ctrl {
	//Method to fetch partner DOB day pickList values
    @AuraEnabled
    public static List<String> getDOBDay()
    {
        List<String> getDOBDay = new List<String>();
        Schema.DescribeFieldResult fieldResult = Application_Form__c.Partner_DOB_Day__c.getDescribe();
        List<Schema.PicklistEntry> pickList = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry p:pickList)
        {
            getDOBDay.add(p.getValue());
        }
        return getDOBDay;
    }
    
    //Method to fetch partner DOB Month pickList values
    @AuraEnabled
    public static List<String> getDOBMonth()
    {
        List<String> getDOBMonth = new List<String>();
        Schema.DescribeFieldResult fieldResult = Application_Form__c.Partner_DOB_Month__c.getDescribe();
        List<Schema.PicklistEntry> pickList = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry p:pickList)
        {
            getDOBMonth.add(p.getValue());
        }
        return getDOBMonth;
    }
    
    //Method to fetch partner DOB year pickList values
    @AuraEnabled
    public static List<String> getDOBYear()
    {
        List<String> getDOBYear = new List<String>();
        Schema.DescribeFieldResult fieldResult = Application_Form__c.Partner_DOB_Year__c.getDescribe();
        List<Schema.PicklistEntry> pickList = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry p:pickList)
        {
            getDOBYear.add(p.getValue());
        }
        return getDOBYear;
    }
    
    //Method to comit the record to the database
    @AuraEnabled
    public static Id commitRecordToDatabase(Application_Form__c appFormRec){
        try{
            insert appFormRec;
        }catch(DMLexception e){
            throw new AuraHandledException(e.getdmlMessage(0));
        }
        return appFormRec.id;
    }
}