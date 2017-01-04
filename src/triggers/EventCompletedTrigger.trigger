/*
    * Name: EventCompletedTrigger
    * Created On: 18 Aug 2015
    * Author: Anant (anant.agarwal@comprotechnologies.com)
* Description:  Updating Status of Lead to Working - Contacted When Event is started.
* Change Log History:
* |----------------------------------------------------------|
* | Version | Changes By | Date   | Description              |
* |----------------------------------------------------------|
* |   0.1   | Anant    | 18-08-15 |Initial version of Trigger|
* |----------------------------------------------------------|  
    */
trigger EventCompletedTrigger on Event (before insert,before update) {
    List<Event> e=Trigger.New;
     List<Lead> l=new List<Lead>();
      ActivityHelperClass c=new ActivityHelperClass();
    Integer len=e.size();
    for(Integer i=0;i<len;i++)
    {
        try{
            if(e[i].StartDateTime<=DateTime.now()) // Check whether the event start time is less than the current time
            {
              /* Lead l1=[SELECT Status FROM LEAD WHERE id=:e[i].WhoID AND Status='Open - Not Contacted']; 
               l1.status='Working - Contacted'; */
                l.add(c.activityCompleted(e[i].WhoID));     
            }
        }
        catch(Exception e1)
        {
            System.debug('No Events'+e1.getMessage());
        }
    }
     //if List l is empty then there is no need to upsert
    if(!l.isEmpty())
        upsert l;
    

}