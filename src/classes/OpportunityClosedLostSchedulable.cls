/*
    * Name: Opps_Closed_Lost1
    * Created On: 14 Jul 2014
    * Author: Anant (anant.agarwal@comprotechnologies.com)
* Description:  There is a custom field on Account called “In-Active”. When this field is checked,
                all the opportunities under this Account should be marked as Closed/Lost.
* Change Log History:
* |----------------------------------------------------------|
* | Version | Changes By | Date   | Description              |
* |----------------------------------------------------------|
* |   0.1   | Anant    | 14-07-15 |Initial version of Trigger|
* |----------------------------------------------------------|  
    */

global class OpportunityClosedLostSchedulable implements Schedulable{
 
 // Execute method
    global void execute(SchedulableContext SC) {
    // Code to be executed when the schedule class wakes up
          // code
    List<Opportunity> op=new List<Opportunity>();
        List<Opportunity> op_update=new List<Opportunity>();
        op=[SELECT Id,StageName,AccountId FROM Opportunity WHERE LastActivityDate__c<:Date.today().addDays(-60)];
        for(Opportunity o:op)
        {
            o.StageName='Closed Lost';
            op_update.add(o);
        }
        update op_update;
   }
 }