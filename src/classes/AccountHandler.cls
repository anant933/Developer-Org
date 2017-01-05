public class AccountHandler {
    public static Account insertNewAccount(String name)
    {
        try{
            System.debug('testing');
                        System.debug('testing');
        Account a=new Account(Name=name);
        insert a;
            System.debug('inserted');
            System.debug('inserted1');
            System.debug('inserted1');
            return a;
        }
        catch(DmlException e)
        {
            System.debug('Error message: '+e.getMessage());
            return null;
        }
    }

}
