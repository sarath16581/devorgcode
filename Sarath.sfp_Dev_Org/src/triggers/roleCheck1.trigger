trigger roleCheck1 on User (after Update) {
   Map<id,userRole> userRoleMap = new Map<id,userRole>([select id,name from userRole]);
    list<User> userList = new list<user>();
    set<id> newUserIds = new set<id>();
        for (user updUser :Trigger.new){
            newUserIds.add(updUser.id);
        }
    userList = [select id,userRoleId from user where id=:newUserIds];
    for(user usrs :userList){
        if(userRoleMap.get(usrs.userRoleid) != null){
          usrs.adderror('Role already assigned, select new Role');
        }
        
    }
}