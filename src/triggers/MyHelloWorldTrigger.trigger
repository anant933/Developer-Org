trigger MyHelloWorldTrigger on Book__c (before insert) {
    Book__c[] books=Trigger.New;
    MyHelloWorld.applyDiscount(books);
 

}