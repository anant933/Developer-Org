/*
    * Name: AccountInactiveClosedLostTrigger
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

trigger AccountInactiveClosedLostTrigger on Account (after insert,after update) {
    List<Opportunity> op=new List<Opportunity>(); 
    /* Query all the opportunities whoes account is In-Active and storing it in a list */
    
    op=[SELECT Id,AccountId,Name,StageName FROM Opportunity WHERE AccountId IN (SELECT Id FROM Account WHERE Id IN :Trigger.New AND In_Active__c=true) AND StageName<>'Closed Lost']; 
    Integer s=op.size()-1;
   
    while(s>=0)
    {  
        op[s].StageName='Closed Lost';      //Set all opportunities stage to closed lost
        s--;
    }
    update op;
}

//SELECT A.Id,A.Name, O.Name FROM Account A, Opportunity O Where A.In_Active__c = true and O.StageName <> 'Closed Lost'  AND O.AccountID = A.ID