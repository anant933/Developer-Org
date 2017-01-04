trigger AddOpportunity1 on Account (after insert,after update) {
    System.debug('Trigger Fired');
    List<Opportunity> ls1=new List<Opportunity>();
     Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
   for(Account a:Trigger.New)
    {
        List<Opportunity> ls=new List<Opportunity>();
        ls=[Select Id FROM Opportunity WHERE AccountId =: a.id];
        if(ls.size()==0)
        {
            System.debug('Size is 0');
            Opportunity o=new Opportunity();
            o.Name='Trigger_Generated';
            o.CloseDate=(Date.today());
            o.StageName='Prospecting';
            o.AccountId=a.id;
            insert o;
        }
        else
        {
            System.debug('Size is not 0');
        }
    
    }

}