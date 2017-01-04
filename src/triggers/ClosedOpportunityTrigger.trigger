trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Opportunity> opps=new List<Opportunity>();
    List<Task> ts=new List<Task>();
    opps=[SELECT Id FROM Opportunity WHERE Id IN:Trigger.New AND StageName='CLOSED WON'];
    for(Opportunity o:opps)
    {
        Task t=new Task();
        t.Subject='Follow Up Test Task';
        //t.Priority='High';
       // t.Status='';
        t.WhatId=o.Id;
        ts.add(t);
    }
    insert ts;

}