trigger AddRelatedRecordBulk on Account (after insert,after update) {
    List<Account> acc=[SELECT Id,Name FROM Account WHERE Id IN :Trigger.New and Id NOT IN (SELECT AccountId FROM Opportunity)];
    List<Opportunity> OppsToUpdate=new List<Opportunity>();
    

}