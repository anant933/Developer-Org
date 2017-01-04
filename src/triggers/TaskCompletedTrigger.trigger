/*
    * Name: TaskCompletedTrigger
    * Created On: 18 Aug 2015
    * Author: Anant (anant.agarwal@comprotechnologies.com)
* Description:  Updating Status of Lead to Working - Contacted When Task is completed
* Change Log History:
* |----------------------------------------------------------|
* | Version | Changes By | Date   | Description              |
* |----------------------------------------------------------|
* |   0.1   | Anant    | 18-08-15 |Initial version of Trigger|
* |----------------------------------------------------------|  
    */

trigger TaskCompletedTrigger on Task (before insert,before update) {
      List<Task> t=Trigger.New;
      List<Lead> l=new List<Lead>();
    Integer len=t.size();
    ActivityHelperClass c=new ActivityHelperClass();
    for(Integer i=0;i<len;i++)
    {
        if(t[i].Status=='Completed') //Check whether task is completed or not
        {
            try{
            
              /* Lead l1=[SELECT Status FROM LEAD WHERE id=:t[i].WhoID AND Status='Open - Not Contacted']; 
               l1.status='Working - Contacted';
               l.add(l1); */
                l.add(c.activityCompleted(t[i].WhoID));
            }
            catch(Exception e)
            {
                System.debug('No lead');
            }
        }
          
    }
    //if List l is empty then there is no need to upsert
   if(!l.isEmpty())
       upsert l;
}