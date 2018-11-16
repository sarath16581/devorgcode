Public without sharing class FormGenerationController{

    
    public String FormName {get;set;}
    
    public FormGenerationController() {
        if (ApexPages.currentPage().getParameters().get('Id') != null){
            FormName = ApexPages.currentPage().getParameters().get('Id');  
        }
    }
}