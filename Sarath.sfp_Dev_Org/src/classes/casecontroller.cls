public with sharing class casecontroller {

    public string SRFlag{get;set;}
    public string field1Value{get;set;}
    public string field2Value{get;set;}
    public string field3Value{get;set;}
    public string field4Value{get;set;}


    public string selectedValue{get;set;}
    public casecontroller(ApexPages.StandardController controller) {

    }
    public void SaveData()
    {
        String recodType;
        if(SRFlag == 'CE')
        {
            recodType = 'CERT_Insurance_Claim';
            
        }
        else if(SRFlag == 'CP')
        {
            recodType = 'PPM_Insurance_Claim';
        }
        else if(SRFlag == 'CRA')
        {
            recodType = 'VSA_Insurance_Claim';
        }
        /*if(recodType!=null)
        RecordType rt = [SELECT Id,Name FROM RecordType WHERE SobjectType='Case' and name=:recodType LIMIT 1];
        Case c = new Case();
        c.RecordTypeid = rt.id;*/
        
    }
    public void populateFields()
    {
        system.debug('printed'+selectedValue);
        if(selectedValue == 'Claim Entry')
        {
            SRFlag = 'CE';
        }
        else if(selectedValue == 'Claim Payment')
        {
            SRFlag = 'CP';
        }
        else if(selectedValue == 'Claim Reversal and Adjustment')
        {
            SRFlag = 'CRA';
        }
        else
        {
            SRFlag = null;
        }
    }

}