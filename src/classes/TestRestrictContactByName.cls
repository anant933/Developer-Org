@isTest
private class TestRestrictContactByName {
    @isTest static void TestRestrictCntactName()
    {
        Account acct=new Account(Name='PQR');
        insert acct;
        Contact c=new Contact(FirstName=Acct.Name+'_c',LastName='INVALIDNAME',AccountId=acct.Id);
        Test.startTest();
        Database.SaveResult r=Database.insert(c,false);
        Test.stopTest();
      //  System.assert(!r.isSuccess());
      //  System.assert(r.getErrors().size()>0);
        System.debug('a'+r.getErrors()[0].getMessage());
        System.assertEquals('Cannot insert Contact with Last NAme=INAVLIDNAME',r.getErrors()[0].getMessage());
    }
    

}