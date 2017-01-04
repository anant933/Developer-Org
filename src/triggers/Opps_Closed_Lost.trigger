trigger Opps_Closed_Lost on Account (after insert,after update) {
  List<Opportunity> op=new List<Opportunity>();
    //  List<Account> acc=[SELECT Id,Name FROM Account WHERE Id IN :Trigger.New and Id NOT IN (SELECT AccountId FROM Opportunity)];
  op=[SELECT Id,AccountId FROM Opportunity WHERE AccountId IN (SELECT Id FROM Account WHERE Id IN :Trigger.New AND In_Active__c=true) AND StageName<>'Closed Lost'];
   //  Account a=new Account();
/*  for(Account a:Trigger.New)
  {*/
      Integer j=0;
      while(j<op.size())
      {
          /*
      if(a.Id==op[j].AccountId)
    
      {if(a.In_Active__c==true)
    {
        Integer i=op.size()-1;
        while(i>=0)
        {*/
           // Opportunity l=new Opportunity();
            op[j].StageName='Closed Lost';
          /*
           // op[i].AccountId=a.Id;
            i--;
            
        }
        
    }
      }
      }*/
  } 
  update op; 
        

}