public class AccountNameUpdateController {
    transient public final String accountName {get; set; }
    public ID accountId;
    public AccountNameUpdateController()
    {
        accountId=ApexPages.currentPage().getParameters().get('id');
        Account acc=new Account();
        acc=[SELECT Name FROM Account WHERE Id=:accountId];
        accountName=acc.Name;
        
    }
    public AccountNameUpdateController(ApexPages.StandardController controller)
    {
       accountId=ApexPages.currentPage().getParameters().get('id');
        Account acc=new Account();
        acc=[SELECT Name FROM Account WHERE Id=:accountId];
        accountName=acc.Name;
         
    }
    public PageReference save()
    {
        Account acc=new Account();
        acc=[SELECT Name,Id FROM Account WHERE Id=:accountId];
        acc.Name=accountName;
        update acc;
        PageReference p=new PageReference('https://ap2.salesforce.com/001/o');
        return p;
    }

}