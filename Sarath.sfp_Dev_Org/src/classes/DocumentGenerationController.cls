Public without sharing class DocumentGenerationController{

    public Document_Generation__c doc{get;set;}
    public Id oppId {get;set;}
    public String oppName {get;set;}
    public blob file { get; set; }
    Public Attachment a{get;set;}
    Public Attachment myfile{get;set;}
    public boolean cmd{get;set;}
    public boolean cmd1{get;set;}

    Public Attachment b{get;set;}
    Public Attachment myfile1 {get;set;}
    
    public DocumentGenerationController(ApexPages.StandardController controller) {
        myfile1 = new Attachment();
        myfile =  new Attachment();
        cmd=false;
        cmd1=false;
        if (ApexPages.currentPage().getParameters().get('Id') != null){
            oppId = ApexPages.currentPage().getParameters().get('Id');  
            Opportunity oppRecord = new Opportunity();
            oppRecord = [Select Name,Id,Account.AccountNumber, Account.Name, Accountid
                         FROM opportunity
                         WHERE id=:oppId];
            if (oppRecord!=null){
                Contact con = new Contact();
                if (oppRecord.Accountid != null){
                    con = [Select id, name, phone, email, fax
                           FROM contact
                           WHERE accountid=:oppRecord.Accountid limit 1];
                }
                doc =  new Document_Generation__c();
                doc.Account_Number__c = oppRecord.Account.AccountNumber;
                doc.Opportunity__c = oppRecord.id;
                oppName = oppRecord.Name;
                doc.Customer_Name__c = oppRecord.Account.Name;
                if (con!=null){
                     doc.Con_Name__c = con.Name;
                    doc.Customer_Fax__c = con.Fax;
                    doc.Customer_Phone__c = con.Phone;
                    doc.Customer_Email__c = con.Email;
                }
            }
        }
    }
    
    public pageReference upload() {
        a = new Attachment();
        a.name = myfile.name;
        a.body = myfile.body;
        cmd=true;
        return null;
    }


    public pageReference upload1() {
        b = new Attachment();
        b.name = myfile1.name;
        b.body = myfile1.body;
        cmd1=true;
        return null;
    }
    public pageReference submitForm(){
        if (doc != null){
            doc.Status__c = 'Not verified';
            insert doc;
            if(doc.id !=null){
                Document_Generation__c  docGenerated = new Document_Generation__c();
                docGenerated = [Select id,name
                                FROM Document_Generation__c
                                WHERE id=:doc.id];
                List<Attachment> attList = new List<Attachment>();
                if(a!=null && a.body!=null && a.name!=null){
                    a.parentId = doc.id;
                    attList.add(a);
                }
                
                if(b!=null && b.body!=null && b.name!=null){
                    b.parentId = doc.id;
                     attList.add(b);
                }
                if (!attList.isEmpty()){
                    insert attList;
                }
                Pagereference pageref = new Pagereference('/apex/Form_Generation?id='+docGenerated.Name);  
                pageref.setRedirect(true);
                return pageref;   
            }
        }
        return null;
    }
    
    
}