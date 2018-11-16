({
	doInit : function(component, event, helper) {
		component.set("v.step1", true);		
        
	},
    
    ContinueStep1Action : function(component, event, helper) {
		//component.set("v.step1", false);
    	//component.set("v.step2", true);
    	helper.step1Validations(component);
	},
    
    ContinueStep2Action : function(component, event, helper) {
		component.set("v.step1", false);
    	component.set("v.step2", false);
    	component.set("v.step3", true);
        helper.DOBDay(component);
        helper.DOBMonth(component);
        helper.DOBYear(component);
	}
})