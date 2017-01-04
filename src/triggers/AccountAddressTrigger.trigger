trigger AccountAddressTrigger on Account (before insert,before update) {
    System.debug('Account Address Trigger');
List<Account> acc=Trigger.New;
    for(Account a:acc)
    {
if(a.Match_Billing_Address__c==true&&a.BillingPostalCode!='')
{
    System.debug('Account Address Trigger Within if');
a.ShippingPostalCode=a.BillingPostalCode;
    System.debug('Account Address Trigger after update');
}
    }

}