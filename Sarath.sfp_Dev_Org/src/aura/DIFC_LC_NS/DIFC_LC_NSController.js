({
	doInit : function(component, event, helper) {
		component.set("v.stp2", true);
	},
    
    Step2Action : function(component, event, helper) {
		component.set("v.stp2", false);
    	component.set("v.stp1", true);
	},
})