trigger roleCheck on User (before insert, before update,after update){
    Set<String> roleNameSet=new Set<String>{'SVP, Customer Service & Support' , 'SVP, Human Resources' , 'SVP, Sales & Marketing'};
    Set<Id> userRoleIdSet=new Set<Id>();
    Set<Id> userRoleIdSetToChk=new Set<Id>();
    for(userRole useRol :[SELECT id  FROM UserRole  WHERE Name IN: roleNameSet])
    {
        userRoleIdSet.add(useRol.Id);
    }
    if(!userRoleIdSet.isEmpty()){
        for(User us :[SELECT id,UserRoleId FROM User WHERE UserRoleId IN : userRoleIdSet]){
           if(Trigger.newMap.get(us.UserRoleId ) !=null){
           userRoleIdSetToChk.add(us.UserRoleId);
           }
           else {
           us.adderror('Role Aleready Assigned, select new Role');
           }
        }
        if(trigger.isInsert){
            for(User usr : Trigger.new){
                if(userRoleIdSetToChk.contains(usr.UserRoleId)){
                    usr.adderror('Role Aleready Assigned, select new Role');
                }
            }
        }if(Trigger.isUpdate){
            for(User usr : Trigger.new){
                if(userRoleIdSetToChk.contains(usr.UserRoleId) && usr.UserRoleId != Trigger.oldMap.get(usr.Id).UserRoleId ){
                    usr.adderror('Role aleready assigned, select new Role');
                }
            }
          
        }
    }
}