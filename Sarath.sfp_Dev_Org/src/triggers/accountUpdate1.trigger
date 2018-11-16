trigger accountUpdate1 on Account (before insert) {
    for (Account a : Trigger.new){
        a.description = 'accountUpdate Trigger description';
    }
}