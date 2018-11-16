({
	DOBDay: function(component, accounttype) {
        var pDOBDay = component.get("c.getDOBDay");
        
        pDOBDay.setCallback(this, function(response) {
            var state = response.getState();console.log('State : ', state);
            if (state === "SUCCESS") {
                component.set("v.globalpDOBDay", response.getReturnValue());
                //Initialize dropdown with values
                var opts1 = [{
                    "class": "optionClass",
                    selected: "true"
                }];;
                var globalpDOBDay = component.get("v.globalpDOBDay");
                for (var i = 0; i < globalpDOBDay.length; i++) {
                    opts1.push({
                        "class": "optionClass",
                        label: globalpDOBDay[i],
                        value: globalpDOBDay[i]
                    });
                }
                component.find("pDOBDay").set("v.options", opts1);
            }
        });
        $A.enqueueAction(pDOBDay);
    },
    
    DOBMonth: function(component, accounttype) {
        var pDOBMonth = component.get("c.getDOBMonth");
        
        pDOBMonth.setCallback(this, function(response) {
            var state = response.getState();console.log('State : ', state);
            if (state === "SUCCESS") {
                component.set("v.globalpDOBMonth", response.getReturnValue());
                //Initialize dropdown with values
                var opts1 = [{
                    "class": "optionClass",
                    selected: "true"
                }];;
                var globalpDOBMonth = component.get("v.globalpDOBMonth");
                for (var i = 0; i < globalpDOBMonth.length; i++) {
                    opts1.push({
                        "class": "optionClass",
                        label: globalpDOBMonth[i],
                        value: globalpDOBMonth[i]
                    });
                }
                component.find("pDOBMon").set("v.options", opts1);
            }
        });
        $A.enqueueAction(pDOBMonth);
    },
    
    DOBYear: function(component, accounttype) {
        var pDOBYear = component.get("c.getDOBYear");
        
        pDOBYear.setCallback(this, function(response) {
            var state = response.getState();console.log('State : ', state);
            if (state === "SUCCESS") {
                component.set("v.globalpDOBYear", response.getReturnValue());
                //Initialize dropdown with values
                var opts1 = [{
                    "class": "optionClass",
                    selected: "true"
                }];;
                var globalpDOBYear = component.get("v.globalpDOBYear");
                for (var i = 0; i < globalpDOBYear.length; i++) {
                    opts1.push({
                        "class": "optionClass",
                        label: globalpDOBYear[i],
                        value: globalpDOBYear[i]
                    });
                }
                component.find("pDOByear").set("v.options", opts1);
            }
        });
        $A.enqueueAction(pDOBYear);
    },
    
    step1Validations: function(component){
        var firstname = component.find("first");
        var lastname = component.find("last");
        var email = component.find("email");
        var conNumber = component.find("phone");
        var requestfirstname = component.get("v.appRecord.First_Name__c");
        var requestlastname = component.get("v.appRecord.Last_Name__c");
        var requestemail = component.get("v.appRecord.EMAIL_ADDRESS__c"); 
        var requestconNumber = component.get("v.appRecord.CONTACT_NUMBER__c");
        if((requestfirstname == undefined || requestfirstname == '') ||
           (requestlastname == undefined || requestlastname == '') ||
           (requestemail == undefined || requestemail == '') ||
           (requestconNumber == undefined || requestconNumber == '' || requestconNumber == '+971')){
            
            if (requestfirstname == undefined || requestfirstname == '') {
                $A.util.addClass(firstname, 'slds-has-error');
                firstname.set("v.errors", [{
                    message: "First Name is Mandatory."
                }]);
            }else{
                $A.util.removeClass(firstname, 'slds-has-error');
                firstname.set("v.errors", [{
                    message: ""
                }]);
            }
            
            if (requestlastname == undefined || requestlastname == '') {
                $A.util.addClass(lastname, 'slds-has-error');
                lastname.set("v.errors", [{
                    message: "Last Name is Mandatory."
                }]);
            }else{
                $A.util.removeClass(lastname, 'slds-has-error');
                lastname.set("v.errors", [{
                    message: ""
                }]);
            }
            
            if (requestemail == undefined || requestemail == '') {
                $A.util.addClass(email, 'slds-has-error');
                email.set("v.errors", [{
                    message: "Email Address is Mandatory."
                }]);
            }else{
                $A.util.removeClass(email, 'slds-has-error');
                email.set("v.errors", [{
                    message: ""
                }]);
            }
            
            if (requestconNumber == undefined || requestconNumber == '' || requestconNumber == '+971') {
                $A.util.addClass(conNumber, 'slds-has-error');
                conNumber.set("v.errors", [{
                    message: "Contact Number is Mandatory."
                }]);
            }else{
                $A.util.removeClass(conNumber, 'slds-has-error');
                conNumber.set("v.errors", [{
                    message: ""
                }]);
            }
        }else{
            
        	//helper.saveaction(component); 
        	$A.util.removeClass(conNumber, 'slds-has-error');
                conNumber.set("v.errors", [{
                    message: ""
            }]);
            $A.util.removeClass(email, 'slds-has-error');
                email.set("v.errors", [{
                    message: ""
            }]);
            $A.util.removeClass(lastname, 'slds-has-error');
                lastname.set("v.errors", [{
                    message: ""
            }]);
            $A.util.removeClass(firstname, 'slds-has-error');
                firstname.set("v.errors", [{
                    message: ""
            }]);
        	var sAction = component.get("c.commitRecordToDatabase"); 
            var appforms = component.get("v.appRecord");
            appforms.sObjectType = 'Application_Form__c';
            sAction.setParams({
                    "appFormRec": appforms,
            }); 
            alert('<<appforms'+appforms);
            sAction.setCallback(this, function(resp) {
                var sActRes = resp.getState();    
                if (sActRes === "SUCCESS") {
                    component.set("v.recordId", resp.getReturnValue()); 
                    
                    component.set("v.step1", false);
    				component.set("v.step2", true);
                }else{
                    var error = resp.getError();
                    component.set("v.message",error[0].message);
                }
            });
            $A.enqueueAction(sAction);
            
            
        }
    },
    handleShowNotice: function(component, nHeader, nVariant, syserr) {
        component.find("notifLib").showNotice({
            header: nHeader,
            variant: nVariant,
            message: syserr
        });
    },
    
    saveaction: function(component) {
        alert('<<came to helper 3');
        var sAction = component.get("c.commitRecordToDatabase"); 
        var appforms = component.get("v.appRecord");
        appforms.sObjectType = 'Application_Form__c';
        sAction.setParams({
                "appFormRec": appforms,
		}); 
        alert('<<came to helper 4');
        sAction.setCallback(this, function(resp) {
        	var sActRes = resp.getState();    
            if (sActRes === "SUCCESS") {
            	component.set("v.recordId", resp.getReturnValue());   
            }
        });
        $A.enqueueAction(sAction);
    },
})