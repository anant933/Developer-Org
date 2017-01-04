@isTest
private class MyHelloWorldTestClass {
    static testMethod void ValidateHelloWorld()
    {
        Book__c b=new Book__c();
        b.Price__c=1000;
        b.Name='Connect the Dots';
        System.debug('Price before inserting book'+b.Price__c);
        insert b;
        b=[SELECT name,price__c FROM Book__c WHERE ID=:b.Id ];
        System.debug('Price after inserting book'+b.Price__c);
        system.assertEquals(900,b.Price__c);
    }

}