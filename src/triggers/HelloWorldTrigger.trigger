trigger HelloWorldTrigger on Account (before insert) {
    Integer i=0;
    for(Account a : Trigger.New) {
        //i=0;
        a.Phone = 'Phone '+i;
        i++;
    }   
}